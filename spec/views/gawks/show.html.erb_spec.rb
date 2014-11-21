require 'rails_helper'

RSpec.describe "gawks/show", :type => :view do
  before(:each) do
    @gawk = assign(:gawk, Gawk.create!())
  end

  it "has a title on the page" do
    render
  end
end
