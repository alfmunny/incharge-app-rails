class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.float :power
      t.float :current
      t.float :voltage

      t.timestamps
    end
  end
end
