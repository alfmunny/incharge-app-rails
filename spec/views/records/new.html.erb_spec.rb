require 'rails_helper'

RSpec.describe "records/new", :type => :view do
  before(:each) do
    assign(:record, Record.new(
      :power => 1.5,
      :current => 1.5,
      :voltage => 1.5
    ))
  end

  it "renders new record form" do
    render

    assert_select "form[action=?][method=?]", records_path, "post" do

      assert_select "input#record_power[name=?]", "record[power]"

      assert_select "input#record_current[name=?]", "record[current]"

      assert_select "input#record_voltage[name=?]", "record[voltage]"
    end
  end
end
