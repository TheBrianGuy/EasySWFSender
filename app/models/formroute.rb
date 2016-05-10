class Formroute < ActiveRecord::Base
  belongs_to :user
  validates :name, length: { minimum: 3 }
  validates :name, presence: true
end
