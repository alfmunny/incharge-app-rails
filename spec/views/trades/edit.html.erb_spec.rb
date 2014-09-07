require 'rails_helper'

RSpec.describe "trades/edit", :type => :view do
  before(:each) do
    @trade = assign(:trade, Trade.create!(
      :transaction_id => "MyString",
      :status => "MyString",
      :energy => 1.5,
      :bill => 1.5
    ))
  end

  it "renders the edit trade form" do
    render

    assert_select "form[action=?][method=?]", trade_path(@trade), "post" do

      assert_select "input#trade_transaction_id[name=?]", "trade[transaction_id]"

      assert_select "input#trade_status[name=?]", "trade[status]"

      assert_select "input#trade_energy[name=?]", "trade[energy]"

      assert_select "input#trade_bill[name=?]", "trade[bill]"
    end
  end
end
