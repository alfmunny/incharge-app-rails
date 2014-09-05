json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :transaction_id, :status, :energy, :bill
  json.url transaction_url(transaction, format: :json)
end
