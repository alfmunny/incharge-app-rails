class ChargePoint < ActiveRecord::Base
  has_many :users
  has_and_belongs_to_many :vehicles
  #has_many :vehicles
  has_many :transactions
end
