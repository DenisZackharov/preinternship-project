class ArticlesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = current_user.articles.create(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end

  end

  def new
    @article = Article.new
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

private
  def article_params
    params.require(:article).permit(:title, :content, :status)
  end
end
