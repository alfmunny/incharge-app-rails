class CreateConnectors < ActiveRecord::Migration
  def change
    create_table :connectors do |t|
      t.string :name
      t.references :charge_point, index: true
      t.timestamps
    end
  end
end
