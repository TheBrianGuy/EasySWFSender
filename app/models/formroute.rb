class Formroute < ActiveRecord::Base
  belongs_to :user
  validates :name, length: { minimum: 3 }
  validates :name, presence: true

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

  def self.authenticateMessage(request, params)
    current_uri_key = request.env["action_dispatch.request.path_parameters"][:key]
    formroute = Formroute.find_by(key: current_uri_key)
    if formroute != nil
      if emptyTag(params, request) == true && authenticateSource(formroute, request) == true 
      # Save message to db 
      amessage = Message.create(
          fwd_msg_to: formroute[:fwd_to_email], 
          msg_from_site: request.referrer, 
          msg_from_email: params["email"], 
          msg_from_name: params["name"],
          msg_from_ipaddress: request.remote_ip, 
          msg_subject: params["_subject"], 
          msg: params["message"])

      # Then forward message to email associated with form
      FormMailer.new_email(formroute, amessage).deliver_now
      end
    else
      puts "Bad Request, No Matching Formroute"
      puts "The ip the message came from is #{request.remote_ip}"
    end
  end

  def self.authenticateSource(formroute, request)
    if formroute.page == request.referrer
      true
    else
      puts "Bad match"
      puts "Came from: #{request.referrer}"
      puts "Expected: #{formroute.page}"
      puts "The ip the message came from is #{request.remote_ip}"
    end
  end

  def self.emptyTag(params, request)
    if params["_gotcha"].empty? == true
      true
    else
      puts "Bad params"
      puts "The ip the message came from is #{request.remote_ip}"
    end
  end

end