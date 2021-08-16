require "rails_helper"

feature "Sign Up" do
  scenario "Visitor signs up" do
    visit new_user_registration_path

    fill_in "Firstname", with: "Denis"
    fill_in "Lastname", with: "Zaharov"
    fill_in "Email", with: Faker::Internet.email
    fill_in "Password", with: "100100"
    fill_in "Password confirmation", with: "100100"

    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end
