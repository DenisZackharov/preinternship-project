require "rails_helper"

feature "ContactForm" do
  scenario "delivers a valid message" do
    visit new_contacts_path
    fill_in "Name", with: "Sergey Antonov"
    fill_in "Email", with: "sergey@everydayrails.com"
    fill_in "Message", with: "What a great website."
    click_button "Send Message"

    expect(page).to have_content("Thank you for your message. I'll get back to you soon!")
    open_email("denis.zaharov@flatstack.com")

    expect(current_email).to have_subject("My Contact Form")
    expect(current_email.from).to eq(["sergey@everydayrails.com"])
    expect(current_email.to).to eq(["denis.zaharov@flatstack.com"])
    expect(current_email).to have_body_text("What a great website.")
  end

  scenario "does not deliver a message with a missing email" do
    visit new_contacts_path
    fill_in "Name", with: "Denis Zahe"
    fill_in "Message", with: "What a great website."
    click_button "Send Message"

    expect(page).to have_content("Message did not send.")
    expect(page).to have_content("Email can't be blank")
  end
end
