require 'spec_helper'

describe "Incharges", js:true do
  describe "GET /" do
    it "should have the content" do
      visit '/'
      expect(page).to have_content('Incharge')
      expect(page).to have_content('Users')
    end
  end
end
