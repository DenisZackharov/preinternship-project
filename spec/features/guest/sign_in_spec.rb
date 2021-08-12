require "rails_helper"

feature "Sign In" do
  before do
    create :user, email: "denis.zaharov@flatstack.com", password: "100100", firstname: "Denis", lastname: "Zaharov"
  end

  def sign_in(email, password)
    visit new_user_session_path

    fill_in "Email", with: email
    fill_in "Password", with: password

    click_button "Log in"
  end

  scenario "Visitor signs in with valid credentials" do
    sign_in("denis.zaharov@flatstack.com", "100100")
    expect(page).to have_content("Hello, Denis Zaharov denis.zaharov@flatstack.com")
  end
end
