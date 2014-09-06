class CreateJoinTableChargePointUser < ActiveRecord::Migration
  def change
    create_join_table :charge_points, :users do |t|
      # t.index [:charge_point_id, :user_id]
      # t.index [:user_id, :charge_point_id]
    end
  end
end
