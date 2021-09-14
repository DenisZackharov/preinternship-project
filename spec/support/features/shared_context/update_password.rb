def update_password(password)

  fill_in "New password", with: password
    fill_in "Confirm new password", with: password

    click_button("Change my password")

  end
