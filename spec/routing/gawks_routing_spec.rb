require "rails_helper"

RSpec.describe GawksController, :type => :routing do
  describe "routing" do
    let(:mash) {"b37f67ef57d48e6d1ebbbac1097eea17f05dfbfd"}

    it "routes to #show" do
      expect(:get => "/#{mash}").to route_to("gawks#show", :mash => mash)
    end

    it "routes to #create" do
      expect(:post => "/addresses/#{mash}/gawks").to route_to("gawks#create", :address_id => mash)
    end

  end
end
