class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :expiry_date, :email, :company, :password
  has_many :vehicles, embed: :ids, include: true
  has_many :charge_points, embed: :ids, include: true
  has_many :transactions, embed: :ids, include: true
end
