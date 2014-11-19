require 'rails_helper'

RSpec.describe "Gawks", :type => :request do
  describe "GET /gawks" do
    it "works! (now write some real specs)" do
      get gawks_path
      expect(response.status).to be(200)
    end
  end
end
