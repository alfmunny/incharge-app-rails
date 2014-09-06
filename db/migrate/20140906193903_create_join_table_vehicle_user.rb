class CreateJoinTableVehicleUser < ActiveRecord::Migration
  def change
    create_join_table :vehicles, :users do |t|
      # t.index [:vehicle_id, :user_id]
      # t.index [:user_id, :vehicle_id]
    end
  end
end
