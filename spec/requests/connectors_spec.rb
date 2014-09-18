require 'rails_helper'

RSpec.describe "Connectors", :type => :request do
  describe "GET /connectors" do
    it "works! (now write some real specs)" do
      get connectors_path
      expect(response.status).to be(200)
    end
  end
end
