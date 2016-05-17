class Message < ActiveRecord::Base
  belongs_to :formroute

  VALID_NAME_REGEX = /\A[a-zA-Z\s]+\z/ #Any letter or whitespace
  VALID_URL_REGEX = /\A#{URI::regexp(['http', 'https'])}\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_IPADDRESS_REGEX = Resolv::IPv4::Regex
  # VALID_MSG_REGEX = /[a-zA-Z]/ #Any letter or whitespace and sentense character and !$,.;:"'?%-

  validates :msg_from_site, presence: true, format: { with: VALID_URL_REGEX }
  validates :msg_from_email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :msg_from_name, length: { minimum: 3, maximum: 20 }
  validates :msg_from_name, presence: true, format: { with: VALID_NAME_REGEX } 
  validates :msg_from_ipaddress, :presence => true, :format => { :with => VALID_IPADDRESS_REGEX }
  validates :msg_subject, length: { minimum: 5, maximum: 30 }
  # validates :msg_subject, presence: true, format: { with: VALID_NAME_REGEX }
  validates :msg, length: { minimum: 10, maximum: 500 }
  # validates :msg, presence: true, format: { with: VALID_MSG_REGEX }


end