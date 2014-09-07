class RenameTableTransaction < ActiveRecord::Migration
  def change
    rename_table :transactions, :trades
  end
end
