class ConnectorSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :charge_point, embed: :ids, include: true
  has_many :trades, embed: :ids, include: true
end
