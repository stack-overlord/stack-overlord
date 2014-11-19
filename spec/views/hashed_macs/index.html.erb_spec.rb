require 'rails_helper'

RSpec.describe "hashed_macs/index", :type => :view do
  before(:each) do
    assign(:hashed_macs, [
      HashedMac.create!(),
      HashedMac.create!()
    ])
  end

  it "renders a list of hashed_macs" do
    render
  end
end
