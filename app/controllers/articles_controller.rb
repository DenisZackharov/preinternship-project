class ArticlesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :update, :destroy, :edit]

  expose :articles, :fetch_articles
  expose :article

  def index
    articles.order(created_at: :asc)
  end

  def show
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
    authorize @article
  end

  def update
    @article = Article.find(params[:id])
    authorize @article
    if @article.update(article_params)
      flash[:notice] = "Article updated!"
      redirect_to article_path(@article)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    authorize @article
    @article.destroy
    flash[:notice] = "Article destroyed!"
    redirect_to articles_path
  end

private

  def fetch_articles
    Article.all
  end

  def article_params
    params.require(:article).permit(:title, :content, :status)
  end

  def filter_params
    params.permit(:status)
  end

  def sort_params
    params.permit(:title)
  end
end
