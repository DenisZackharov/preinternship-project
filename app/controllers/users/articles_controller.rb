module Users
  class ArticlesController < ApplicationController

    expose :articles, -> { current_user.articles.where(filter_params) }
    expose :article, scope: -> {current_user.articles}

    before_action :authenticate_user!
    before_action :authorize_resource!, only: %i[edit update destroy]

    def index
    end

    def show
    end

    def create
       article.save
       respond_with article, location: user_article_path(current_user, article.id)
    end

    def new
    end

    def edit
    end

    def update
      if article.update(article_params)
        respond_with article, location: user_article_path(current_user, article.id)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      article.destroy
      respond_with(article)
    end

  private

    def authorize_resource!
      authorize article
    end

    def article_params
      params.require(:article).permit(:title, :content, :status)
    end

    def filtered_articles
      current_user.articles.where(filter_params)
    end

    def filter_params
      params.permit(:status).with_defaults(status: "public")
    end

  end
end