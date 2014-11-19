require 'rails_helper'

RSpec.describe "gawks/index", :type => :view do
  before(:each) do
    assign(:gawks, [
      Gawk.create!(),
      Gawk.create!()
    ])
  end

  it "renders a list of gawks" do
    render
  end
end
