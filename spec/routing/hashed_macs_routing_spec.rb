require "rails_helper"

RSpec.describe HashedMacsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/hashed_macs").to route_to("hashed_macs#index")
    end

    it "routes to #new" do
      expect(:get => "/hashed_macs/new").to route_to("hashed_macs#new")
    end

    it "routes to #show" do
      expect(:get => "/hashed_macs/1").to route_to("hashed_macs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/hashed_macs/1/edit").to route_to("hashed_macs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/hashed_macs").to route_to("hashed_macs#create")
    end

    it "routes to #update" do
      expect(:put => "/hashed_macs/1").to route_to("hashed_macs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/hashed_macs/1").to route_to("hashed_macs#destroy", :id => "1")
    end

  end
end
