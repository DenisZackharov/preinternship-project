module Articles
  class SaveRecord
    include Interactor
    
    delegate :article, :article_params, to: :context

    def call
      article.update!(article_params)
      context.fail!(error: "Article invalid") if article.invalid?
    end
  end
end
