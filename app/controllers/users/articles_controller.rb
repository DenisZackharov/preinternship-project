module Users
  class ArticlesController < ApplicationController
    expose :decorated_articles, -> { ArticleDecorator.decorate_collection(fetch_articles) }
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
    def filtered_articles
      FilteredArticlesQuery.new(raw_relation, filter_params).all
    end

    def fetch_articles
      filtered_articles.order(created_at: :desc).page(params[:page])
    end

    def authorize_resource!
      authorize article
    end

    def article_params
      params.require(:article).permit(:title, :content, :status)
    end

    def filter_params
      params.permit(:status).with_defaults(status: "public").to_h
    end

    def raw_relation
      current_user.articles
    end
  end
end
