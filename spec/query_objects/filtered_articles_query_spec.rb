require "rails_helper"

describe FilteredArticlesQuery do
  subject(:query) { described_class.new(articles, filter_params).all }

  let(:articles) { Article.all }
  let(:filter_params) { {} }
  let!(:article1) { create :article,  title: "Public", status: "public" }
  let!(:article2) { create :article, title: "Draft", status: "draft" }
  let!(:article3) { create :article, title: "Public", status: "public" }

  describe "#all" do
    subject(:all) { query.all }

    it { is_expected.to match_array([article1, article2, article3]) }
  end

  describe "#by_status" do
    let(:filter_params) { { status: status } }

    context "when filter by public articles" do
      let(:status) { "public" }

      it { is_expected.to match_array([article1, article3]) }
    end

    context "when filter by draft articles" do
      let(:status) { "draft" }

      it { is_expected.to match_array([article2]) }
    end
  end
end
