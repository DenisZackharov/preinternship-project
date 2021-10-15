require "rails_helper"

feature "ListArticle" do

  before do
    create :user,  firstname: "Timur", id: 2
    create :user,  firstname: "Gleb", id: 3
  end

  let!(:current_user) { create :user, email: "denis.zaharov@flatstack.com", password: "100100", firstname: "Denis", lastname: "Zaharov", id: 1 }

  let!(:article1) { create :article, title: "First public", status: "public", user_id: 1 }
  let!(:article2) { create :article, title: "Second drafted", status: "draft", user_id: 1 }
  let!(:article3) { create :article, title: "Third public", status: "public", user_id: 2 }
  let!(:article4) { create :article, title: "Fourth public", status: "public", user_id: 3 }
  let!(:article5) { create :article, title: "Fifth drafted", status: "draft", user_id: 1 }
  let!(:article6) { create :article, title: "Sixth public", status: "public", user_id: 1 }

  scenario "Guest see only public article" do
    visit articles_path

    expect(page).to have_content("Denis : First public")
    expect(page).to have_content("Timur : Third public")
    expect(page).to have_content("Gleb : Fourth public")
    expect(page).to have_content("Denis : Sixth public")
    expect(page).to_not have_content("Denis : Second drafted")
    expect(page).to_not have_content("Denis : Fifth drafted")
  end

  scenario "User see himself public article in My articles" do
    login_as current_user
    visit user_articles_path

    expect(page).to have_content("Denis : First public")
    expect(page).to_not have_content("Denis : Second drafted")
    expect(page).to_not have_content("Timur : Third public")
    expect(page).to_not have_content("Gleb : Fourth public")
    expect(page).to_not have_content("Denis : Fifth drafted")
    expect(page).to have_content("Denis : Sixth public")
  end
  scenario "User see himself drafted article in My articles drafted articles" do
    login_as current_user
    visit user_articles_path(status: :draft)

    expect(page).to_not have_content("Denis : First public")
    expect(page).to have_content("Denis : Second drafted")
    expect(page).to_not have_content("Timur : Third public")
    expect(page).to_not have_content("Gleb : Fourth public")
    expect(page).to have_content("Denis : Fifth drafted")
    expect(page).to_not have_content("Denis : Sixth public")
  end
end
