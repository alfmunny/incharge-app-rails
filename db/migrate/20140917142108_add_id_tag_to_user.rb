class AddIdTagToUser < ActiveRecord::Migration
  def change
    add_column :users, :id_tag, :string
  end
end
