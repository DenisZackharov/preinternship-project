module Articles
  class DraftedArticlesController < ApplicationController
    before_action: :authenticate_user!
    def index
      @articles = current_user.articles.where(status: "drafted")
    end
  end
end
