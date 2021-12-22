require "rails_helper"

feature "DestroyArticle" do
  include_context "current user signed in"

  background do
    create :article, title: "First", content: "hello", status: "public", user_id: 1
  end

  scenario "User destroy article" do
    visit user_articles_path
    expect(page).to have_content("Denis : First")

    visit user_article_path(current_user)
    click_link "Destroy"

    expect(page).to have_content("Article was successfully destroyed.")
    expect(page).to_not have_content("Denis : First")
  end
end
