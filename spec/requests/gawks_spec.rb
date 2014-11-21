require 'rails_helper'

RSpec.describe "Gawks", :type => :request do
  let(:mash) {"b37f67ef57d48e6d1ebbbac1097eea17f05dfbfd"}
  let!(:address) {Address.create(:mash => mash)}
  let!(:gawk) {address.gawks.create}

  describe "GET /mash" do

    it "gets a successful response with a valid mash and associated gawk" do
      get "/#{mash}"
      expect(response.status).to be(200)
    end
  end
end
