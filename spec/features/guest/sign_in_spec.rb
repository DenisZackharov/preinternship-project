require "rails_helper"

feature "Sign In" do

  let!(:user) { create :user, email: email, password: password }

  let(:email) { "denis.zaharov@flatstack.com" }
  let(:password) { "100100" }
  
  def sign_in(email, password)
    visit new_user_session_path

    fill_in "Email", with: email
    fill_in "Password", with: password

    click_button "Log in"
   end
   
  scenario "Visitor signs in with valid credentials" do
    sign_in(user.email, user.password)
    expect(page).to have_content("Sign out")
  end
end
