class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  has_secure_password

  has_many :formroutes
  # validates :password, presence: true, length: { minimum: 8 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
