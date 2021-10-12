class ArticlesController < ApplicationController
  expose :articles, :fetch_articles
  expose :article, scope: -> { Article.public }

  def index
  end

  def show
  end

  private
  def fetch_articles
    Article.public.order(created_at: :desc).page(params[:page])
  end
end
