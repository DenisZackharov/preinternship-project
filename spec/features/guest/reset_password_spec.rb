require "rails_helper"

feature "Reset password" do
  background do
    create :user, email: user_email, password: "100100", firstname: "Denis", lastname: "Zaharov"
  end

  let(:user_email) { "denis.zaharov@flatstack.com" }
  let(:new_password) { "100123" }

  scenario "Visitor reset password with existing email" do
    visit new_user_session_path

    click_link("Forgot your password?")

    expect(page).to have_button("Send me reset password instructions")

    fill_in "Email", with: user_email
    click_button("Send me reset password instructions")

    expect(page).to have_text("You will receive an email with instructions on how to reset your password in a few minutes.")

    open_email(user_email)

    expect(current_email).to have_subject("Reset password instructions")
    expect(current_email).to have_body_text(user_email)

    visit_in_email("Change my password")

    expect(page).to have_content("Change your password")

    fill_in "New password", with: new_password
    fill_in "Confirm new password", with: "invalid"

    click_button("Change my password")

    expect(page).to have_content("Password confirmation doesn't match Password")

    fill_in "New password", with: new_password
    fill_in "Confirm new password", with: new_password

    click_button("Change my password")

    expect(page).to have_content("Your password has been changed successfully. You are now signed in.")

    click_link("Sign out")
    page.accept_alert

    click_link("Sign in")
    sign_in("denis.zaharov@flatstack.com", new_password)
    expect(page).to have_content("Signed in successfully.")
  end

  scenario "Visitor reset password with unexisting email" do
    visit new_user_session_path

    click_link("Forgot your password?")
    expect(page).to have_button("Send me reset password instructions")

    fill_in "Email", with: "Invalid@example.com"

    click_button("Send me reset password instructions")
    expect(page).to have_text("Email not found")
  end
end
