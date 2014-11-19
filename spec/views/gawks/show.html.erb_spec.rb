require 'rails_helper'

RSpec.describe "gawks/show", :type => :view do
  before(:each) do
    @gawk = assign(:gawk, Gawk.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
