require "rails_helper"

describe User do
  let(:user) { build :user, firstname: firstname, lastname: lastname, email: email, password: password, password_confirmation: password_confirmation }

  let(:firstname) { "Denis" }
  let(:lastname) { "Zaharov" }
  let(:email) { "denis.zaharov@flatstack.com" }
  let(:password) { "password" }
  let(:password_confirmation) { password }

  describe "#valid?" do
    it { expect(user.valid?).to be_truthy }

    context "when firstname is blank" do
      let(:firstname) { nil }

      let(:expected_errors) { ["Firstname can't be blank"] }

      it "validates user" do
        expect(user.valid?).to be_falsey
        expect(user.errors.full_messages).to eq(expected_errors)
      end
    end

    context "when lastname is blank" do
      let(:lastname) { nil }

      let(:expected_errors) { ["Lastname can't be blank"] }

      it "validates user" do
        expect(user.valid?).to be_falsey
        expect(user.errors.full_messages).to eq(expected_errors)
      end
    end

    context "when email is blank" do
      let(:email) { nil }

      let(:expected_errors) { ["Email can't be blank"] }

      it "validates user" do
        expect(user.valid?).to be_falsey
        expect(user.errors.full_messages).to eq(expected_errors)
      end
    end

    context "when password is blank" do
      let(:password) { nil }

      let(:expected_errors) { ["Password can't be blank"] }

      it "validates user" do
        expect(user.valid?).to be_falsey
        expect(user.errors.full_messages).to eq(expected_errors)
      end
    end

    context "when email not valid" do
      let(:email) { Faker::Lorem.word }

      let(:expected_errors) { ["Email is invalid"] }

      it "validates user" do
        expect(user.valid?).to be_falsey
        expect(user.errors.full_messages).to eq(expected_errors)
      end
    end

    context "when confirmation password doesn't match" do
      let(:password_confirmation) { "12345" }

      let(:expected_errors) { ["Password confirmation doesn't match Password"] }

      it "validates user" do
        expect(user.valid?).to be_falsey
        expect(user.errors.full_messages).to eq(expected_errors)
      end
    end
  end
end
