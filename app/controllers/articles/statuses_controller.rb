module Articles
  class StatusesController < ApplicationController

    expose :article, parent: :current_user

    before_action :authenticate_user!

    def update
      authorize article
      article.update(status_params)
    end

    private

    def status_params
      params.require(:article).permit(:status)
    end
  end
end
