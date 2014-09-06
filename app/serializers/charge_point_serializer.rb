class ChargePointSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :charge_point_vendor,
            :charge_point_model, :charge_point_serial_number,
            :firmware_version, :iccid, :imsi, :meter_type,
            :meter_serial_number, :heartbeat_interval,
            :charge_box_serial_number,
            :created_at, :updated_at
  has_many :vehicles, embed: :ids, include: true
  has_many :users, embed: :ids, include: true
  has_many :transactions, embed: :ids, include: true
end
