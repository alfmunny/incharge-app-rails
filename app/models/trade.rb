class Trade < ActiveRecord::Base
  belongs_to :charge_point
  belongs_to :user
  belongs_to :vehicle
  has_many :records
end
