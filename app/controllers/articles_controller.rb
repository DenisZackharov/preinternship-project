class ArticlesController < ApplicationController

  expose :articles, ->  { Article.public.order(created_at: :desc) }
  expose :article, scope: -> { Article.public }

  def index
  end

  def show
  end

end
