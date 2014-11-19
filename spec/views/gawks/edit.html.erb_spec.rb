require 'rails_helper'

RSpec.describe "gawks/edit", :type => :view do
  before(:each) do
    @gawk = assign(:gawk, Gawk.create!())
  end

  it "renders the edit gawk form" do
    render

    assert_select "form[action=?][method=?]", gawk_path(@gawk), "post" do
    end
  end
end
