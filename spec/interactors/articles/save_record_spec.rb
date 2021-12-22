require "rails_helper"

describe Articles::SaveRecord do
  include_context "with interactor"

  describe ".call" do
    let(:initial_context) do
      {
        article: article,
        article_params: article_params
      }
    end

    let(:article_params) do
      {
        title: "First",
        content: "article title",
        status: "draft"
      }
    end

    context "when create article" do
      let(:article) { build :article }

      it "creates article" do
        expect { interactor.run }.to change(Article, :count).by(1)

        expect(article).to have_attributes(article_params)
      end
    end

    context "when update article" do
      let!(:article) do
        create :article, title: "Not changed", content: "not changed", status: "draft"
      end

      it "updates article" do
        expect { interactor.run }.not_to change(Article, :count)

        expect(article).to have_attributes(article_params)
      end
    end

    context "when params is invalid" do
      let(:article) { build :article }
      let(:article_params) { { title: nil, content: nil, status: nil } }
      let(:error_data) do
        {
          message: "Record invalid",
          detail: [
              "Title can't be blank", "Content can't be blank",
              "Title is too short (minimum is 3 characters)",
              "Content is too short (minimum is 3 characters)",
              "Status can't be blank"
            ]
        }
      end

      it_behaves_like "failed interactor"
    end
  end
end
