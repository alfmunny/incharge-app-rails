require 'rails_helper'

RSpec.describe "connectors/index", :type => :view do
  before(:each) do
    assign(:connectors, [
      Connector.create!(
        :name => "Name",
        :chargePoint => nil
      ),
      Connector.create!(
        :name => "Name",
        :chargePoint => nil
      )
    ])
  end

  it "renders a list of connectors" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
