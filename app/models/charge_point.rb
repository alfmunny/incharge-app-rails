class ChargePoint < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :vehicles
  has_many :trades
  has_many :connectors
  accepts_nested_attributes_for :users
end
