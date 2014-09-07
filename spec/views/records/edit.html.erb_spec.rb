require 'rails_helper'

RSpec.describe "records/edit", :type => :view do
  before(:each) do
    @record = assign(:record, Record.create!(
      :power => 1.5,
      :current => 1.5,
      :voltage => 1.5
    ))
  end

  it "renders the edit record form" do
    render

    assert_select "form[action=?][method=?]", record_path(@record), "post" do

      assert_select "input#record_power[name=?]", "record[power]"

      assert_select "input#record_current[name=?]", "record[current]"

      assert_select "input#record_voltage[name=?]", "record[voltage]"
    end
  end
end
