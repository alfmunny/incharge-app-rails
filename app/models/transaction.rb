class Transaction < ActiveRecord::Base
  belongs_to :charge_point
  belongs_to :user
  belongs_to :vehicle
end
