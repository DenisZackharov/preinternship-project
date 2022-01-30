after :users do
  print "Creating articles..."

  admin = User.find_by_firstname("Admin")
  user_1 = User.find_by_firstname("Denis")

  Article.create!(user: admin, title: "Article1", content: "hi it's a first article", status: "public", tag_list: "public, admin")
  Article.create!(user: admin, title: "Article2", content: "hi it's a second article", status: "public", tag_list: "public, admin")
  Article.create!(user: admin, title: "Article2", content: "hi it's a thirth article", status: "draft", tag_list: "draft, admin")

  Article.create!(user: user_1, title: "Article4", content: "hi it's a Denis first article", status: "public", tag_list: "public, user")
  Article.create!(user: user_1, title: "Article5", content: "hi it's a Denis second article", status: "draft", tag_list: "draft, user")
  Article.create!(user: user_1, title: "Article6", content: "hi it's a Denis thirth article", status: "public", tag_list: "public, user")

  puts "Done!"
end
