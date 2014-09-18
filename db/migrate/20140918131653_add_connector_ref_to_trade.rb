class AddConnectorRefToTrade < ActiveRecord::Migration
  def change
    add_reference :trades, :connector, index: true
  end
end
