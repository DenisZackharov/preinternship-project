class ArticlesController < ApplicationController

  expose :articles, ->  { Article.published }
  expose :article, scope: -> { Article.published }

  def index
  end

  def show
  end

end
