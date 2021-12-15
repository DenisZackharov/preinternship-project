module Articles
  class SaveRecord
    include Interactor

    delegate :article, :article_params, to: :context

    def call
      context.fail!(error: error_data) unless article.update(article_params)
    end

    private

    def error_data
      
    end
  end
end
