require "rails_helper"

feature "Sign out" do
  before do
    create :user, email: "denis.zaharov@flatstack.com", password: "100100", firstname: "Denis", lastname: "Zaharov"
  end

  scenario "Visitor sign out" do
    sign_out("denis.zaharov@flatstack.com", "100100")
    expect(page).to have_content("Signed out successfully.")
  end
end
