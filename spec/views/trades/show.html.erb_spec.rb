require 'rails_helper'

RSpec.describe "trades/show", :type => :view do
  before(:each) do
    @trade = assign(:trade, Trade.create!(
      :transaction_id => "Transaction",
      :status => "Status",
      :energy => 1.5,
      :bill => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Transaction/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
  end
end
