require 'rails_helper'

RSpec.describe "hashed_macs/new", :type => :view do
  before(:each) do
    assign(:hashed_mac, HashedMac.new())
  end

  it "renders new hashed_mac form" do
    render

    assert_select "form[action=?][method=?]", hashed_macs_path, "post" do
    end
  end
end
