json.array!(@connectors) do |connector|
  json.extract! connector, :id, :name, :chargePoint_id
  json.url connector_url(connector, format: :json)
end
