require 'rails_helper'

RSpec.describe "charge_points/index", :type => :view do
  before(:each) do
    assign(:charge_points, [
      ChargePoint.create!(
        :status => "Status",
        :charge_point_vendor => "Charge Point Vendor",
        :charge_point_model => "Charge Point Model",
        :charge_point_serial_number => "Charge Point Serial Number",
        :firmware_version => "Firmware Version",
        :iccid => "Iccid",
        :imsi => "Imsi",
        :meter_type => "Meter Type",
        :meter_serial_number => "Meter Serial Number",
        :heartbeat_interval => 1,
        :charge_box_serial_number => "Charge Box Serial Number"
      ),
      ChargePoint.create!(
        :status => "Status",
        :charge_point_vendor => "Charge Point Vendor",
        :charge_point_model => "Charge Point Model",
        :charge_point_serial_number => "Charge Point Serial Number",
        :firmware_version => "Firmware Version",
        :iccid => "Iccid",
        :imsi => "Imsi",
        :meter_type => "Meter Type",
        :meter_serial_number => "Meter Serial Number",
        :heartbeat_interval => 1,
        :charge_box_serial_number => "Charge Box Serial Number"
      )
    ])
  end

  it "renders a list of charge_points" do
    render
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Charge Point Vendor".to_s, :count => 2
    assert_select "tr>td", :text => "Charge Point Model".to_s, :count => 2
    assert_select "tr>td", :text => "Charge Point Serial Number".to_s, :count => 2
    assert_select "tr>td", :text => "Firmware Version".to_s, :count => 2
    assert_select "tr>td", :text => "Iccid".to_s, :count => 2
    assert_select "tr>td", :text => "Imsi".to_s, :count => 2
    assert_select "tr>td", :text => "Meter Type".to_s, :count => 2
    assert_select "tr>td", :text => "Meter Serial Number".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Charge Box Serial Number".to_s, :count => 2
  end
end
