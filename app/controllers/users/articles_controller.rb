module Users
  class ArticlesController < ApplicationController
    expose :decorated_articles, -> { ArticleDecorator.decorate_collection(fetch_articles) }
    expose :article, parent: :current_user

    before_action :authenticate_user!
    before_action :authorize_resource!, only: %i[edit update destroy]

    def index
    end

    def show
      if params[:tag]
        respond_with decorated_articles, location: -> { tag_path(decorated_articles.ids) }
      end
    end

    def create
      create_article
      respond_with article, location: -> { user_article_path(article.id) }
    end

    def new
    end

    def edit
    end

    def update
      update_article
      respond_with article, location: user_article_path(article.id)
    end

    def destroy
      article.destroy
      respond_with article, location: user_articles_path
    end

  private

    def create_article
      ::Articles::Create.call(article: article, article_params: article_params)
    end

    def update_article
      ::Articles::Update.call(article: article, article_params: article_params)
    end

    def fetch_articles
      filtered_articles.order(created_at: :desc).page(params[:page])
    end

    def filtered_articles
      FilteredArticlesQuery.new(raw_relation, filter_params).all
    end

    def article_params
      params.require(:article).permit(:title, :content, :status, :tag_list)
    end

    def raw_relation
      current_user.articles
    end

    def filter_params
      params.permit(:status).with_defaults(status: "public").to_h
    end

    def authorize_resource!
      authorize article, :manage?
    end

    def article_params
      params.require(:article).permit(:title, :content, :status)
    end
  end
end
