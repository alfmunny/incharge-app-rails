class Vehicle < ActiveRecord::Base
  has_many :transactions
  has_many :users
  has_and_belongs_to_many :charge_points
end
