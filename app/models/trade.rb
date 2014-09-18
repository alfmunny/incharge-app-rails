class Trade < ActiveRecord::Base
  belongs_to :charge_point
  belongs_to :user
  belongs_to :vehicle
  belongs_to :connector
  has_many :records
end
