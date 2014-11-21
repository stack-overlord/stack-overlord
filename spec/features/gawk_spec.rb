require 'rails_helper'

feature "User visits his Overlord" do
  scenario "when a new exception is thrown" do
    address = Address.create!(mash: "b37f67ef57d48e6d1ebbbac1097eea17f05dfbfd")
    address.gawks.create!(error_class: "stack", message: "overflow")
    visit "/b37f67ef57d48e6d1ebbbac1097eea17f05dfbfd"
    expect(page).to have_selector('#gawkward')
  end
end
