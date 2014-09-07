class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :vehicle_type, :name, :created_at, :updated_at
  has_many :users, embed: :ids, include: true
  has_many :charge_points, embed: :ids, include: true
  has_many :trades, embed: :ids, include: true
end
