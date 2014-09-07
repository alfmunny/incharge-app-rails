require 'rails_helper'

RSpec.describe "records/index", :type => :view do
  before(:each) do
    assign(:records, [
      Record.create!(
        :power => 1.5,
        :current => 1.5,
        :voltage => 1.5
      ),
      Record.create!(
        :power => 1.5,
        :current => 1.5,
        :voltage => 1.5
      )
    ])
  end

  it "renders a list of records" do
    render
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
