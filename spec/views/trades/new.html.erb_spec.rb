require 'rails_helper'

RSpec.describe "trades/new", :type => :view do
  before(:each) do
    assign(:trade, Trade.new(
      :transaction_id => "MyString",
      :status => "MyString",
      :energy => 1.5,
      :bill => 1.5
    ))
  end

  it "renders new trade form" do
    render

    assert_select "form[action=?][method=?]", trades_path, "post" do

      assert_select "input#trade_transaction_id[name=?]", "trade[transaction_id]"

      assert_select "input#trade_status[name=?]", "trade[status]"

      assert_select "input#trade_energy[name=?]", "trade[energy]"

      assert_select "input#trade_bill[name=?]", "trade[bill]"
    end
  end
end
