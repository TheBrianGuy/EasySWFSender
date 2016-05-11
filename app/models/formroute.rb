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
      if emptyTag(params) == true && authenticateSource(formroute, request) == true    

      puts "hello all good"
      # accept message and record in message table
      # then forward message to email associated with form
      # note: add email column to formroute table

      end
    else
      puts "Bad Request, No Matching Formroute"
    end
  end

  def self.authenticateSource(formroute, request)
    if formroute.page == request.referrer
      true
    else
      puts "Bad match"
      puts "Came from: #{request.referrer}"
      puts "Expected: #{formroute.page}"
    end
  end

  def self.emptyTag(params)
    if params["_gotcha"].empty? == true
      true
    else
      puts "Bad params"
    end
  end

end