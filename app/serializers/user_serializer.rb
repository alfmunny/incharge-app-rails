class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :expiryDate, :email, :company
end
