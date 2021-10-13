require "rails_helper"

describe ContactMailer, type: :mailer do
  let(:contact) { ContactMailer.new(name: name, email: email, message: message) }
  let(:name) { "Denis" }
  let(:email) { "denis@mail.com" }
  let(:message) { "hahaha" }
  describe "#valid?" do
    it { expect(contact.valid?).to be_truthy }

    context "when name is blank" do
      let(:name) { nil }

      let(:expected_errors) { ["Name can't be blank"] }

      it "validates contact form" do
        expect(contact.valid?).to be_falsey
        expect(contact.errors.full_messages).to eq(expected_errors)
      end
    end

    context "when email is blank" do
      let(:email) { nil }

      let(:expected_errors) { ["Email can't be blank"] }

      it "validates contact form" do
        expect(contact.valid?).to be_falsey
        expect(contact.errors.full_messages).to eq(expected_errors)
      end
    end

    context "when email is not valid" do
      let(:email) { "haha" }

      let(:expected_errors) { ["Email is invalid"] }

      it "validates contact form" do
        expect(contact.valid?).to be_falsey
        expect(contact.errors.full_messages).to eq(expected_errors)
      end
    end

    context "when message is blank" do
      let(:message) { nil }

      let(:expected_errors) { ["Message can't be blank"] }

      it "validates contact form" do
        expect(contact.valid?).to be_falsey
        expect(contact.errors.full_messages).to eq(expected_errors)
      end
    end
  end

  describe "#headers" do
    let(:mail) { contact.headers }

    it "renders the headers" do
      expect(mail[:subject]).to eq("My Contact Form")
      expect(mail[:to]).to eq("denis.zaharov@flatstack.com")
      expect(mail[:from]).to eq("\"Denis\" <denis@mail.com>")
    end
  end
end
