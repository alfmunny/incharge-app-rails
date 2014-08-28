json.array!(@charge_points) do |charge_point|
  json.extract! charge_point, :id, :status, :charge_point_vendor, :charge_point_model, :charge_point_serial_number, :firmware_version, :iccid, :imsi, :meter_type, :meter_serial_number, :heartbeat_interval, :charge_box_serial_number
  json.url charge_point_url(charge_point, format: :json)
end
