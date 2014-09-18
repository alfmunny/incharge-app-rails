require 'rails_helper'

RSpec.describe "connectors/new", :type => :view do
  before(:each) do
    assign(:connector, Connector.new(
      :name => "MyString",
      :chargePoint => nil
    ))
  end

  it "renders new connector form" do
    render

    assert_select "form[action=?][method=?]", connectors_path, "post" do

      assert_select "input#connector_name[name=?]", "connector[name]"

      assert_select "input#connector_chargePoint_id[name=?]", "connector[chargePoint_id]"
    end
  end
end
