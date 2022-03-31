module Users
  module Articles
    class DraftsController < ApplicationController
      expose :article, parent: :current_user

      def update
        authorize article
        article.update(status: "draft")
        redirect_to user_articles_path
      end
    end
  end
end
