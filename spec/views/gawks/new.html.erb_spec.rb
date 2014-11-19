require 'rails_helper'

RSpec.describe "gawks/new", :type => :view do
  before(:each) do
    assign(:gawk, Gawk.new())
  end

  it "renders new gawk form" do
    render

    assert_select "form[action=?][method=?]", gawks_path, "post" do
    end
  end
end
