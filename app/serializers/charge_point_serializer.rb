class ChargePointSerializer < ActiveModel::Serializer
  attributes :id, :status, :charge_point_vendor, :charge_point_model, :charge_point_serial_number, :firmware_version, :iccid, :imsi, :meter_type, :meter_serial_number, :heartbeat_interval, :charge_box_serial_number
end
