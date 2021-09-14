require "rails_helper"

feature "reset_password" do
  background do
    create :user, email: "denis.zaharov@flatstack.com", password: "100100", firstname: "Denis", lastname: "Zaharov"
  end

  let(:user_email) { User.find_by(email: "denis.zaharov@flatstack.com").email }
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

    update_password(new_password)

    expect(page).to have_text("Your password has been changed successfully. You are now signed in.")

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

    fill_in "Email", with: Faker::Internet.email

    click_button("Send me reset password instructions")
    expect(page).to have_text("Email not found")
  end
end
