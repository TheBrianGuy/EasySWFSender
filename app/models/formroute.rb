class Formroute < ActiveRecord::Base
  belongs_to :user

  VALID_NAME_REGEX = /\A[a-zA-Z\s]+\z/ #Any letter or whitespace
  VALID_URL_REGEX = /\A#{URI::regexp(['http', 'https'])}\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, length: { minimum: 3, maximum: 20 }
  validates :name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :page, presence: true, format: { with: VALID_URL_REGEX }
  validates :fwd_to_email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }

  before_create :generateKey

  def generateKey
    range = [*'0'..'9', *'a'..'z']
    begin
      newkey = Array.new(15){range.sample}.join
    end while checkExistence(newkey)
    self.key = newkey
  end

  def checkExistence(newkey)
    Formroute.exists?(key: newkey)
  end

  def self.errorMsgs
    @e ||= {"codeErrors": []}
    @statusCode ||= 200
  end

  def self.authenticateMessage(request, params)
    errorMsgs
    @e = {"codeErrors": []}; @statusCode = 200
    current_uri_key = request.env["action_dispatch.request.path_parameters"][:key]
    formroute = Formroute.find_by(key: current_uri_key)
    if formroute != nil
      if emptyTag(params, request) == true && authenticateSource(formroute, request) == true 
        # Save message to db 
        amessage = self.compileMessage(formroute, request, params)
        # Then forward message to email associated with form
        self.deliverMsg(formroute, amessage) unless amessage == false
      end
    else
      puts @e[:codeErrors].push("Bad Request, No Matching Formroute")
      puts "The ip the message came from is #{request.remote_ip}"
      @statusCode = 400
    end
    return true, @e, @statusCode
  end

  def self.authenticateSource(formroute, request)
    if formroute.page == request.referrer
      true
    else
      puts @e[:codeErrors].push("Bad Match, Came from: #{request.referrer}")
      puts @e[:codeErrors].push("Bad Match, Expected: #{formroute.page}")
      puts "The ip the message came from is #{request.remote_ip}"
      @statusCode = 400
    end
  end

  def self.emptyTag(params, request)
    if params["funText"].empty? == true
      true
    else
      # puts @e[:codeErrors].push("Bad params, check logs")
      puts "Bad params from IP Address: #{request.remote_ip}"
      puts "Bad params, Came from: #{request.referrer}"
      # @statusCode = 400
      
      # Silently ignore
      false
    end
  end


  def self.compileMessage(formroute, request, params)
    begin
      # Save message to db
      amessage = Message.new(
        fwd_msg_to: formroute[:fwd_to_email], 
        msg_from_site: request.referrer, 
        msg_from_email: params["email"], 
        msg_from_name: params["name"],
        msg_from_ipaddress: request.remote_ip, 
        msg_subject: params["subject"], 
        msg: params["message"],
        formroute_id: formroute[:id])
      amessage.save!
    rescue ActiveRecord::RecordInvalid => e
      # push e into hash and set statusCode
      @e[:codeErrors].push("Message input not valid")
      e.record.errors.messages.each { |key, value| @e[:codeErrors].push("#{key} #{value[0]}") }
      @statusCode = 422
      amessage = false
    end
    amessage
  end

  def self.deliverMsg(formroute, amessage)
    begin
      FormMailer.new_email(formroute, amessage).deliver_now
    rescue => e
      # push e into hash and set statusCode
      @e[:codeErrors].push("Error sending message")
      @e[:codeErrors].push(e.message)
      @statusCode = 500
    end
    true
  end

  def self.totalmessages(formroute_id)
    Message.where(formroute_id: formroute_id).count
  end 

  def self.changeValidationAttrNames(errors)
    # Change attribute names on form Validations
    if errors[:codeErrors].size !=0
      errors[:codeErrors].each do |text| 
        text.sub! 'msg_from_site', 'Form Origin'
        text.sub! 'msg_from_email', 'Your Email'
        text.sub! 'msg_from_name', 'Your Name'
        text.sub! 'msg_from_ipaddress', 'IP Error'
        text.sub! 'msg_subject', 'Subject'
        text.sub! 'msg', 'Your Message'
      end
    end
    errors
  end

end
