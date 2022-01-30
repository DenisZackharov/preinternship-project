module Users
  module Articles
    class PublishesController < ApplicationController
      expose :article, parent: :current_user

      def update
        authorize article
        article.update(status: "public")
        redirect_to articles_path
      end
    end
  end
end
