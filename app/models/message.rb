class Message < ActiveRecord::Base
  validates :msg, length: { minimum: 10 }
  validates :msg_from_name, presence: true, length: { minimum: 3 }
  # validates :page, presence: true
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :fwd_to_email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
end



# fwd_msg_to: string, 
# msg_from_site: string, 
# msg_from_email: string, 
# msg_from_name: string, 
# msg_from_ipaddress: string, 
# msg_subject: string, 
# msg: text, 
