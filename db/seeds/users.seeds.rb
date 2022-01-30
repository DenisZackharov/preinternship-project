print "Creating users... "

  admin = User.create!(email: "admin@admin.com", password: 123456, firstname: "Admin", lastname: "Admin")
  user = User.create!(email: "denis.zaharov@example.com", password: 123456, firstname: "Denis", lastname: "Zaharov")

  admin.confirm
  user.confirm

  puts "Done!"