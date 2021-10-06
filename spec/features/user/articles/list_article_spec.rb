require "rails_helper"

feature "ListArticle" do
  let!(:user1) { create :user,  firstname: "Den" }
  let!(:user2) { create :user,  firstname: "Gleb" }
  let!(:user3) { create :user,  firstname: "Emil" }

  let!(:article1) { create :article, title: "First public", status: "public", user_id: 1 }
  let!(:article2) { create :article, title: "Second drafted", status: "draft", user_id: 1 }
  let!(:article3) { create :article, title: "Third public", status: "public", user_id: 2 }
  let!(:article4) { create :article, title: "Fourth public", status: "public", user_id: 3 }
  let!(:article5) { create :article, title: "Fifth archived", status: "archive", user_id: 1 }
  let!(:article6) { create :article, title: "Sixth public", status: "public", user_id: 1 }

  scenario "Guest see only public article" do
    visit articles_path

    expect(page).to have_content("Den : First public")
    expect(page).to have_content("Gleb : Third public")
    expect(page).to have_content("Emil : Fourth public")
    expect(page).to have_content("Den : Sixth public")
  end
end
