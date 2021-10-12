module Users
  class ArticlesController < ApplicationController
    expose :articles, :fetch_articles
    expose :article, parent: :current_user

    before_action :authenticate_user!
    before_action :authorize_resource!, only: %i[edit update destroy]

    def index
    end

    def show
    end

    def create
      article.save
      respond_with article, location: -> { user_article_path(article.id) }
    end

    def new
    end

    def edit
    end

    def update
      article.update(article_params)
      respond_with article, location: user_article_path(article.id)
    end

    def destroy
      article.destroy
      respond_with article, location: user_articles_path
    end

  private

    def fetch_articles
      current_user.articles.where(filter_params).order(created_at: :desc).page(params[:page])
    end

    def authorize_resource!
      authorize article
    end

    def article_params
      params.require(:article).permit(:title, :content, :status)
    end

    def filter_params
      params.permit(:status).with_defaults(status: "public")
    end
  end
end
