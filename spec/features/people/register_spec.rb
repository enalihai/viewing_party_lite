require "rails_helper"

RSpec.describe "Register New User" do
  it "has a form to register new user name, email, and password with button" do
    visit root_path

    click_button "Create New User"

    expect(current_path).to eq(register_path)

    fill_in "Name", with: "Jamison Ordway"
    fill_in "Email", with: "jordway@mailg.com"
    fill_in "Password", with: "abc123iou"
    fill_in "Confirm Password", with: "abc123iou"

    click_button "Register"

    person = Person.last

    expect(current_path).to eq(person_path(person.id))
    expect(page).to have_content("Jamison Ordway")
  end
end

# person = Person.last,  check out 'reload'
