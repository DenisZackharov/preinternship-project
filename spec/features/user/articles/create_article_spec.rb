require "rails_helper"

feature "CreateArticle" do
  include_context "current user signed in"

  background do
    visit new_user_article_path(current_user)
  end

  scenario "User create article with valid data" do
    fill_form(:article, :new, title: "First article", content: "Hello")
    click_on "Create Article"

    expect(page).to have_content("First")
    expect(page).to have_button("Publish")
  end

  scenario "User create article with invalid data" do
    fill_form(:article, :new, title: "Fi", content: "Hello")
    click_on "Create Article"

  end
end
