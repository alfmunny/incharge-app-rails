class RenameIndexTransactionRecords < ActiveRecord::Migration
  def change
    remove_reference :records, :transaction
    add_reference :records, :trade, index: true
  end
end
