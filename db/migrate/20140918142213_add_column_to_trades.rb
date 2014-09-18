class AddColumnToTrades < ActiveRecord::Migration
  def change
    add_column :trades, :meter_start, :integer
    add_column :trades, :meter_stop, :integer
    add_column :trades, :timestamp, :datetime
  end
end
