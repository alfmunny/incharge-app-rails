require 'rails_helper'

RSpec.describe "connectors/edit", :type => :view do
  before(:each) do
    @connector = assign(:connector, Connector.create!(
      :name => "MyString",
      :chargePoint => nil
    ))
  end

  it "renders the edit connector form" do
    render

    assert_select "form[action=?][method=?]", connector_path(@connector), "post" do

      assert_select "input#connector_name[name=?]", "connector[name]"

      assert_select "input#connector_chargePoint_id[name=?]", "connector[chargePoint_id]"
    end
  end
end
