require "rails_helper"

describe Article do
  let(:article) { build :article, title: title, content: content, status: status }

  let(:title) { "First" }
  let(:content) { "Hello" }
  let(:status) { "public" }

  describe "#valid?" do
    it { expect(article.valid?).to be_truthy }

    context "when title is blank" do
      let(:title) { nil }

      let(:expected_errors) { ["Title can't be blank", "Title is too short (minimum is 3 characters)"] }

      it "validates article" do
        expect(article.valid?).to be_falsey
        expect(article.errors.full_messages).to eq(expected_errors)
      end
    end

    context "when content is blank" do
      let(:content) { nil }

      let(:expected_errors) { ["Content can't be blank", "Content is too short (minimum is 3 characters)"] }

      it "validates article" do
        expect(article.valid?).to be_falsey
        expect(article.errors.full_messages).to eq(expected_errors)
      end
    end

    context "when status is blank" do
      let(:status) { nil }

      it "validates article" do
        expect(article.valid?).to be_falsey
      end
    end

    context "when status is not valid" do
      let(:status) { "denis" }

      it "validates article" do
        expect(article.valid?).to be_falsey
      end
    end
  end
end
