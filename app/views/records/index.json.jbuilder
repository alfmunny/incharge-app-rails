json.array!(@records) do |record|
  json.extract! record, :id, :power, :current, :voltage
  json.url record_url(record, format: :json)
end
