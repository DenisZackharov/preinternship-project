require "rails_helper"

feature "Sign out" do
  background do
    create :user, email: "denis.zaharov@flatstack.com", password: "100100", firstname: "Denis", lastname: "Zaharov"
  end

  scenario "Visitor sign out" do
    sign_in("denis.zaharov@flatstack.com", "100100")
    click_link "Sign out"
    page.accept_alert
    expect(page).to have_content("Signed out successfully.")
  end
end
