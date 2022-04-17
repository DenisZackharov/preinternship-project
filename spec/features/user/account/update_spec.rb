require "rails_helper"

feature "Update Account" do
  include_context "current user signed in"

  background do
    visit edit_user_registration_path(current_user)
  end

  scenario "User updates account with valid data" do
    fill_form(:user, :edit, firstname: "Sergey", lastname: "Antonov")
    fill_form(:user, :new, current_password: "100100")
    click_on "Update"

    expect(page).to have_content("Your account has been updated successfully.")
  end

  scenario "User enters not matched passwords" do
    fill_form(:user, :edit, password: "qwerty", password_confirmation: "123123")
    click_on "Update"

    expect(page).to have_content("doesn't match Password")
  end

  scenario "User does not enter the current password when editing" do
    fill_form(:user, :edit, password: "123123", password_confirmation: "123123")
    click_on "Update"

    expect(page).to have_content("Current password can't be blank")
  end
end
