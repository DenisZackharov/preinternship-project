class ArticlesController < ApplicationController
  expose :decorated_articles, -> { ArticleDecorator.decorate_collection(fetch_articles) }
  expose :article, scope: -> { Article.public }

  # def tag_cloud
  #   @tags = Article.tag_counts_on(:tags)
  # end

  def index
    if params[:tag]
      decorated_articles = Article.tagged_with(params[:tag])
    else
      decorated_articles
    end
  end

  private

  def fetch_articles
    Article.public.order(created_at: :desc).page(params[:page])
  end
end
