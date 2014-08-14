class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :expiryDate, :date
    add_column :users, :company, :string
  end
end
