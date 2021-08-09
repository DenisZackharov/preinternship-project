require "rails_helper"

feature "Sign Up" do
  let(:user) { create :user, firstname: firstname, lastname: lastname, email: email, password: password, password_confirmation: password_confirmation }
  
  let(:firstname) { "Denis" }
  let(:lastname) { "Zaharov" }
  let(:email) { Faker::Internet.email }
  let(:password) { "password" }
  let(:password_confirmation) { password }

  scenario "Visitor signs up" do
    visit new_user_registration_path

    fill_in "Firstname", with: firstname
    fill_in "Lastname", with: lastname
    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password_confirmation

    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")

  end
end