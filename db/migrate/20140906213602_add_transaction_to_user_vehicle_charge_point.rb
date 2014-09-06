class AddTransactionToUserVehicleChargePoint < ActiveRecord::Migration
  def change
    add_reference :transactions, :user, index: true
    add_reference :transactions, :vehicle, index: true
    add_reference :transactions, :charge_point, index: true
  end
end
