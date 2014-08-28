require "rails_helper"

RSpec.describe ChargePointsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/charge_points").to route_to("charge_points#index")
    end

    it "routes to #new" do
      expect(:get => "/charge_points/new").to route_to("charge_points#new")
    end

    it "routes to #show" do
      expect(:get => "/charge_points/1").to route_to("charge_points#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/charge_points/1/edit").to route_to("charge_points#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/charge_points").to route_to("charge_points#create")
    end

    it "routes to #update" do
      expect(:put => "/charge_points/1").to route_to("charge_points#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/charge_points/1").to route_to("charge_points#destroy", :id => "1")
    end

  end
end
