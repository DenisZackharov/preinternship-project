require "rails_helper"

describe ArticlePolicy do
  subject(:policy) { ArticlePolicy.new(user, record) }

  describe "#edit?" do
    subject { policy.edit? }

    context "when user is authenticated" do
      let(:record) { create :article, user_id: 1 }
      let(:user) { create :user, id: 1, confirmed_at: 1.hour.ago }

      it { is_expected.to eq(true) }
    end

    context "when user is not  authenticated" do
      let(:record) { create :article }
      let(:user) { nil }

      it { is_expected.to eq(false) }
    end
  end
end
