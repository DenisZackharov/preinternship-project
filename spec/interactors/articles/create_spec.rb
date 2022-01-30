require "rails_helper"

describe Articles::Create do
  describe ".organized" do
    subject { described_class.organized }

    let(:expected_interactors) do
      [
        Articles::SaveRecord
      ]
    end

    it { is_expected.to eq(expected_interactors) }
  end
end
