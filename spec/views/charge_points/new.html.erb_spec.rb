require 'rails_helper'

RSpec.describe "charge_points/new", :type => :view do
  before(:each) do
    assign(:charge_point, ChargePoint.new(
      :status => "MyString",
      :charge_point_vendor => "MyString",
      :charge_point_model => "MyString",
      :charge_point_serial_number => "MyString",
      :firmware_version => "MyString",
      :iccid => "MyString",
      :imsi => "MyString",
      :meter_type => "MyString",
      :meter_serial_number => "MyString",
      :heartbeat_interval => 1,
      :charge_box_serial_number => "MyString"
    ))
  end

  it "renders new charge_point form" do
    render

    assert_select "form[action=?][method=?]", charge_points_path, "post" do

      assert_select "input#charge_point_status[name=?]", "charge_point[status]"

      assert_select "input#charge_point_charge_point_vendor[name=?]", "charge_point[charge_point_vendor]"

      assert_select "input#charge_point_charge_point_model[name=?]", "charge_point[charge_point_model]"

      assert_select "input#charge_point_charge_point_serial_number[name=?]", "charge_point[charge_point_serial_number]"

      assert_select "input#charge_point_firmware_version[name=?]", "charge_point[firmware_version]"

      assert_select "input#charge_point_iccid[name=?]", "charge_point[iccid]"

      assert_select "input#charge_point_imsi[name=?]", "charge_point[imsi]"

      assert_select "input#charge_point_meter_type[name=?]", "charge_point[meter_type]"

      assert_select "input#charge_point_meter_serial_number[name=?]", "charge_point[meter_serial_number]"

      assert_select "input#charge_point_heartbeat_interval[name=?]", "charge_point[heartbeat_interval]"

      assert_select "input#charge_point_charge_box_serial_number[name=?]", "charge_point[charge_box_serial_number]"
    end
  end
end
