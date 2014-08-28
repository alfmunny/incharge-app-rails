require 'rails_helper'

RSpec.describe "charge_points/show", :type => :view do
  before(:each) do
    @charge_point = assign(:charge_point, ChargePoint.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Charge Point Vendor/)
    expect(rendered).to match(/Charge Point Model/)
    expect(rendered).to match(/Charge Point Serial Number/)
    expect(rendered).to match(/Firmware Version/)
    expect(rendered).to match(/Iccid/)
    expect(rendered).to match(/Imsi/)
    expect(rendered).to match(/Meter Type/)
    expect(rendered).to match(/Meter Serial Number/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Charge Box Serial Number/)
  end
end
