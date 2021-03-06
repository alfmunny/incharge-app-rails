class User < ActiveRecord::Base
  #before_save { self.email = email.downcase }
  #validates :name, presence: true, length: { maximum: 50 }
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  #                  uniqueness: { case_sensitive: false }
  has_secure_password :validations => false
  #validates :password, length: { minimum: 6 }, :if => :password

  has_and_belongs_to_many :vehicles
  has_and_belongs_to_many :charge_points
  has_many :trades
  accepts_nested_attributes_for :charge_points
end
