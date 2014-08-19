class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :expiryDate, :expiry_date
  end
end
