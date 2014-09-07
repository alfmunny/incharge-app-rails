require 'rails_helper'

RSpec.describe "trades/index", :type => :view do
  before(:each) do
    assign(:trades, [
      Trade.create!(
        :transaction_id => "Transaction",
        :status => "Status",
        :energy => 1.5,
        :bill => 1.5
      ),
      Trade.create!(
        :transaction_id => "Transaction",
        :status => "Status",
        :energy => 1.5,
        :bill => 1.5
      )
    ])
  end

  it "renders a list of trades" do
    render
    assert_select "tr>td", :text => "Transaction".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
