class TradeSerializer < ActiveModel::Serializer
  attributes :id, :transaction_id, :status, :energy, :bill, :created_at, :updated_at
  has_one :user, embed: :ids, include: true
  has_one :vehicle, embed: :ids, include: true
  has_one :charge_point, embed: :ids, include: true
  has_many :records, embed: :ids, include: true
end
