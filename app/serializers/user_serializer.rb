class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :expiry_date, :email, :company, :password
end
