class RecordSerializer < ActiveModel::Serializer
  attributes :id, :power, :current, :voltage, :created_at
  has_one :trade, embed: :ids, include: true
end
