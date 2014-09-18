class Connector < ActiveRecord::Base
  belongs_to :charge_point
  has_many :trades
end
