module Users
  class ArticlesController < ApplicationController

    expose :articles, -> { current_user.articles.where(filter_params).order(created_at: :desc) }
    expose :article, parent: :current_user

    before_action :authenticate_user!
    before_action :authorize_resource!, only: %i[edit update destroy]

    def index
    end

    def show
    end

    def create
      article.save
      respond_with article, location: user_article_path(current_user, article)
    end

    def new
    end

    def edit
    end

    def update
      if article.update(article_params)
        respond_with article, location: user_article_path(current_user, article)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      article.destroy
      respond_with article, location: user_articles_path(current_user)
    end

  private

    def authorize_resource!
      authorize article
    end

    def article_params
      params.require(:article).permit(:title, :content, :status, :user_id)
    end

    def filter_params
      params.permit(:status).with_defaults(status: "public")
    end

  end
end
