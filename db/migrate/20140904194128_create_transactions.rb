class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :transaction_id
      t.string :status
      t.float :energy
      t.float :bill

      t.timestamps
    end
  end
end
