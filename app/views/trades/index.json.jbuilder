json.array!(@trades) do |trade|
  json.extract! trade, :id, :transaction_id, :status, :energy, :bill
  json.url trade_url(trade, format: :json)
end
