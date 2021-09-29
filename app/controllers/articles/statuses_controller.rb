module Articles
  class StatusesController < ApplicationController

    expose :article, parent: :current_user

    before_action :authenticate_user!

    def update
      authorize article
      if article.update(status_params)
        flash[:notice] = "Article updated!"
        redirect_to article_path(article)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def status_params
      params.require(:article).permit(:status)
    end
  end
end
