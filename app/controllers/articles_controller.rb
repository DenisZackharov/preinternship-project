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
    @articles = current_user.articles.where(status: "drafted")
  end

  def create
    @article = current_user.articles.create(article_params)

    if @article.save
      redirect_to @article
      flash[:notice] = "Article created!"
    else
      render :new, status: :unprocessable_entity
    end

  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article updated!"
      redirect_to article_path(@article)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article destroyed!"
    redirect_to articles_path
  end

private
  def article_params
    params.require(:article).permit(:title, :content, :status)
  end

end
