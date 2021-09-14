require "rails_helper"

feature "resend_confirmation" do

  let(:user) { create :user }
  let(:unconfirmed_user) { create :user, :not_confirmed, email: "denis.zaharov@flatstack.com" }

    scenario "Unconfirmed visitor resend confirmation instructions" do
      visit new_user_session_path

        click_link("Didn't receive confirmation instructions?")

        expect(page).to have_text("Resend confirmation instructions")

        fill_in "Email", with: unconfirmed_user.email
        click_button("Resend confirmation instructions")

        expect(page).to have_text("You will receive an email with instructions for how to confirm your email address in a few minutes.")

        open_email(unconfirmed_user.email)

        expect(current_email).to have_subject("Confirmation instructions")
        expect(current_email).to have_body_text(unconfirmed_user.email)

        visit_in_email("Confirm my account")

        expect(page).to have_text("Your email address has been successfully confirmed.")
    end

    scenario "Confirmed visitor resend confirmation instructions" do
      visit new_user_session_path

        click_link("Didn't receive confirmation instructions?")

        expect(page).to have_text("Resend confirmation instructions")

        fill_in "Email", with: user.email
        click_button("Resend confirmation instructions")
        expect(page).to have_text("Email was already confirmed, please try signing in")
    end
end
