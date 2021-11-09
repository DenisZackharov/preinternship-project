require "rails_helper"

describe ArticlePolicy do
  subject(:policy) { ArticlePolicy.new(user, record) }

  describe "#edit?" do
    subject { policy.edit? }

    let(:user) { User.new(id: 2) }

    context "when user is not creator of the article" do
      let(:record) { Article.new }

      it { is_expected.to eq(false) }
    end

    context "when user is creator of the article" do
      let(:record) { Article.new(user: user) }

      it { is_expected.to eq(true) }
    end
  end
end
