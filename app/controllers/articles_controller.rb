class ArticlesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]

  def index
    @articles = Article.all
    @articles.order(created_at: :asc)
  end

  def show
    @article = Article.find(params[:id])
  end

  def index_drafted
    @articles = Article.where(status: "drafted")
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

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "Article updated!"
      redirect_to article_path(@article)
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
