class AddTransactionRefToRecords < ActiveRecord::Migration
  def change
    add_reference :records, :transaction, index: true
  end
end
