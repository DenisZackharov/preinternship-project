require "rails_helper"

feature "Sign In" do
  background do
    create :user, email: "denis.zaharov@flatstack.com", password: "100100", firstname: "Denis", lastname: "Zaharov"
  end

  scenario "Visitor Sign in with valid credentials" do
    sign_in("denis.zaharov@flatstack.com", "100100")
    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Hello, Denis Zaharov (denis.zaharov@flatstack.com)")
  end

  scenario "Visitor Sign in with invalid credentials" do
    sign_in("denis.zaharov@flatstack.com", "wrong password")

    expect(page).to have_content("Sign in")
    expect(page).to have_content("Invalid Email or password")
  end
end
