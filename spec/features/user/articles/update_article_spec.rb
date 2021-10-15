require "rails_helper"

feature "UpdateArticle" do
  include_context "current user signed in"

  let(:article) { create :article, title: "First", content: "hello", status: "public", user_id: 1 }

  scenario "User edit article with valid data" do
    visit user_article_path(article)

    click_on "Edit"
    fill_in "Title", with: "Edited"
    fill_in "Content", with: "Hi all!"
    click_on "Update Article"

    expect(page).to have_content("Article was successfully updated.")
    expect(page).to have_content("Edited")
    expect(page).to have_button("Make a draft")

    click_link "Back to articles"
    expect(page).to have_link("Denis : Edited")

    click_on "Denis : Edited"
    expect(page).to have_button("Make a draft")
    click_button "Make a draft"

    expect(page).to have_content("Article was successfully updated.")
    expect(page).to have_button("Publish")
    expect(page).to have_content("Back to drafted articles")

    click_button "Publish"

    expect(page).to have_content("Article was successfully updated.")
    expect(page).to have_button("Make a draft")
    expect(page).to_not have_content("Back to drafted articles")
  end

  scenario "User update article with invalid data" do
    visit user_article_path(article)

    click_on "Edit"

    fill_in "Title", with: "Ed"
    fill_in "Content", with: "Hi"
    click_on "Update Article"

    expect(page).to have_content("Article could not be updated")
    expect(page).to have_content("Title is too short (minimum is 3 characters)")
    expect(page).to have_content("Content is too short (minimum is 3 characters)")
  end

  scenario "User update article with empty data" do
    visit user_article_path(article)

    click_on "Edit"

    fill_in "Title", with: ""
    fill_in "Content", with: ""
    click_on "Update Article"
    expect(page).to have_content("Article could not be updated")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Title is too short (minimum is 3 characters)")
    expect(page).to have_content("Content can't be blank")
    expect(page).to have_content("Content is too short (minimum is 3 characters)")
  end
end
