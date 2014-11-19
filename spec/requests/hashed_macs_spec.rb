require 'rails_helper'

RSpec.describe "HashedMacs", :type => :request do
  describe "GET /hashed_macs" do
    it "works! (now write some real specs)" do
      get hashed_macs_path
      expect(response.status).to be(200)
    end
  end
end
