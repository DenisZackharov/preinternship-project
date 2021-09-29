class ArticlesController < ApplicationController

  expose :articles, -> { status_filter }
  expose :article, parent: :current_user

  before_action :authenticate_user!, only: %i[new create]
  before_action :authorize_resource!, only: %i[edit update destroy]

  def index
  end

  def show
  end

  def create
    if article.save
      redirect_to article
      flash[:notice] = "Article created!"
    else
      render :new, status: :unprocessable_entity
    end

  end

  def new
  end

  def edit
  end

  def update
    if article.update(article_params)
      flash[:notice] = "Article updated!"
      redirect_to article_path(article)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    article.destroy
    flash[:notice] = "Article destroyed!"
    redirect_to articles_path
  end

private

  def authorize_resource!
    authorize article
  end

  def article_params
    params.require(:article).permit(:title, :content, :status)
  end

  def status_filter
    current_user.articles.where(filter_params)
  end

  def filter_params
    params.permit(:status)
  end

end
