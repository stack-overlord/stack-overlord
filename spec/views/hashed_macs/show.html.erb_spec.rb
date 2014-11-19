require 'rails_helper'

RSpec.describe "hashed_macs/show", :type => :view do
  before(:each) do
    @hashed_mac = assign(:hashed_mac, HashedMac.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
