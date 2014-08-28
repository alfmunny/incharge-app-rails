class CreateChargePoints < ActiveRecord::Migration
  def change
    create_table :charge_points do |t|
      t.string :status
      t.string :charge_point_vendor
      t.string :charge_point_model
      t.string :charge_point_serial_number
      t.string :firmware_version
      t.string :iccid
      t.string :imsi
      t.string :meter_type
      t.string :meter_serial_number
      t.integer :heartbeat_interval
      t.string :charge_box_serial_number

      t.timestamps
    end
  end
end
