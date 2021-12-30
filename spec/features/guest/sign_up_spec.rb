require "rails_helper"

feature "Sign Up" do

  let(:user_email) { "denis.zaharov@flatstack.com" }
  let(:registered_user) { User.find_by(email: user_email) }

  scenario "Visitor signs up" do
    visit new_user_registration_path

    fill_in "Firstname", with: "Denis"
    fill_in "Lastname", with: "Zaharov"
    fill_in "Email", with: user_email
    fill_in "Password", with: "100100"
    fill_in "Password confirmation", with: "100100"

    click_button "Sign up"

    open_email(registered_user.email)

    expect(current_email).to have_subject("Confirmation instructions")
    expect(current_email).to have_body_text(registered_user.email)
    visit_in_email("Confirm my account")

    expect(page).to have_content("Your email address has been successfully confirmed")
    expect(page).to have_button("Log in")

    sign_in(user_email, "100100")
    expect(page).to have_content("Denis Zaharov")
  end
end
