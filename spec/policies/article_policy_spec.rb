require "rails_helper"

describe ArticlePolicy do
  subject(:policy) { ArticlePolicy.new(user, record) }

  describe "#manage?" do
    subject { policy.manage? }

    let(:user) { build :user, id: 2  }

    context "when user is not creator of the article" do
      let(:record) { build :article }

      it { is_expected.to be_falsey }
    end

    context "when user is creator of the article" do
      let(:record) { Article.new(user: user) }

      it { is_expected.to be_truthy }
    end
  end
end
