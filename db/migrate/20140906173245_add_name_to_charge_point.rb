class AddNameToChargePoint < ActiveRecord::Migration
  def change
    add_column :charge_points, :name, :string
  end
end
