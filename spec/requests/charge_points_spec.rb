require 'rails_helper'

RSpec.describe "ChargePoints", :type => :request do
  describe "GET /charge_points" do
    it "works! (now write some real specs)" do
      get charge_points_path
      expect(response.status).to be(200)
    end
  end
end
