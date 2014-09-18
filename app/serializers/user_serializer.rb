class UserSerializer < ActiveModel::Serializer
  attributes :id, :id_tag, :name, :expiry_date, :email, :company, :password
  has_many :vehicles, embed: :ids, include: true
  has_many :charge_points, embed: :ids, include: true
  has_many :trades, embed: :ids, include: true
end
