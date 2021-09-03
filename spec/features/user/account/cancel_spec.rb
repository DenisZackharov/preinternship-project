require "rails_helper"

feature "Cancel Account" do
  include_context "current user signed in"

  background do
    visit edit_user_registration_path(current_user)
  end

  scenario "User cancels account" do
    click_button "Cancel my account"
    page.accept_alert
    expect(page).to have_content("Sign in")
    expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")

    click_link "Sign in"
    fill_in "Email", with: "denis.zaharov@flatstack.com"
    fill_in "Password", with: "100100"
    click_button "Log in"

    expect(page).to have_content("Invalid Email or password.")
  end
end
