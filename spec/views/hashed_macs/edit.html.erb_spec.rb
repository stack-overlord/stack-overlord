require 'rails_helper'

RSpec.describe "hashed_macs/edit", :type => :view do
  before(:each) do
    @hashed_mac = assign(:hashed_mac, HashedMac.create!())
  end

  it "renders the edit hashed_mac form" do
    render

    assert_select "form[action=?][method=?]", hashed_mac_path(@hashed_mac), "post" do
    end
  end
end
