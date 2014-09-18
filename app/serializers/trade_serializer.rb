class TradeSerializer < ActiveModel::Serializer
  attributes :id, :status, :energy, :bill, :created_at, :updated_at, :timestamp, :meter_start, :meter_stop
  has_one :user, embed: :ids, include: true
  has_one :vehicle, embed: :ids, include: true
  has_one :charge_point, embed: :ids, include: true
  has_many :records, embed: :ids, include: true
  has_one :connector, embed: :ids, include: true
end
