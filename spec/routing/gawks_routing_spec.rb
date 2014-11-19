require "rails_helper"

RSpec.describe GawksController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/gawks").to route_to("gawks#index")
    end

    it "routes to #new" do
      expect(:get => "/gawks/new").to route_to("gawks#new")
    end

    it "routes to #show" do
      expect(:get => "/gawks/1").to route_to("gawks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/gawks/1/edit").to route_to("gawks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/gawks").to route_to("gawks#create")
    end

    it "routes to #update" do
      expect(:put => "/gawks/1").to route_to("gawks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/gawks/1").to route_to("gawks#destroy", :id => "1")
    end

  end
end
