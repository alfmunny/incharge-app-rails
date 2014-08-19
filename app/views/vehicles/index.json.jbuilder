json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :id, :vehicle_type, :name
  json.url vehicle_url(vehicle, format: :json)
end
