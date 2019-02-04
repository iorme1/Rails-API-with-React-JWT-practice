require "rails_helper"

RSpec.describe BananasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/bananas").to route_to("bananas#index")
    end

    it "routes to #show" do
      expect(:get => "/bananas/1").to route_to("bananas#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/bananas").to route_to("bananas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/bananas/1").to route_to("bananas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/bananas/1").to route_to("bananas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/bananas/1").to route_to("bananas#destroy", :id => "1")
    end
  end
end
