module Articles
  class StatusesController < ApplicationController
before_action: :authenticate_user!
    def update
      @article = Article.find(params[:id])
      authorize @article
      if @article.update(status_params)
        flash[:notice] = "Article updated!"
        redirect_to article_path(@article)
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
