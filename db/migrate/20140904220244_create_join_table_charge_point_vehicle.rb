class CreateJoinTableChargePointVehicle < ActiveRecord::Migration
  def change
    create_join_table :charge_points, :vehicles do |t|
      # t.index [:charge_point_id, :vehicle_id]
      # t.index [:vehicle_id, :charge_point_id]
    end
  end
end
