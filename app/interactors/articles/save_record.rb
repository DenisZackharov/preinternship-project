module Articles
  class SaveRecord
    include Interactor

    delegate :article, :article_params, to: :context

    def call
      context.fail!(error_data: error_data) unless article.update(article_params)
    end

    private

    def error_data
      { message: I18n.t("errors.messages.record_invalid"), detail: article.errors.to_a }
    end
  end
end
