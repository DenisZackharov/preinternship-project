shared_context "current user signed in" do
  let(:current_user) { create :user, email: "denis.zaharov@flatstack.com", password: "100100", firstname: "Denis", lastname: "Zaharov" }

    background do
      login_as current_user
    end
end
