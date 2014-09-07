require 'rails_helper'

RSpec.describe "records/show", :type => :view do
  before(:each) do
    @record = assign(:record, Record.create!(
      :power => 1.5,
      :current => 1.5,
      :voltage => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
  end
end
