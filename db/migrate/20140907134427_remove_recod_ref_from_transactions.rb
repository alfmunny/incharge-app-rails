class RemoveRecodRefFromTransactions < ActiveRecord::Migration
  def change
    remove_reference :transactions, :record, index: true
  end
end
