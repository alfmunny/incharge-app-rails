class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :transaction_id, :status, :energy, :bill
end
