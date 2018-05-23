require "rails_helper"

RSpec.describe PlansController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/plans").to route_to("plans#index")
    end


    it "routes to #show" do
      expect(:get => "/plans/1").to route_to("plans#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/plans").to route_to("plans#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/plans/1").to route_to("plans#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/plans/1").to route_to("plans#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/plans/1").to route_to("plans#destroy", :id => "1")
    end

  end
end
