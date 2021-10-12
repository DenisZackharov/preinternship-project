class ArticleDecorator < ApplicationDecorator
  delegate all

  def link_to_article
    link_to "#{article.user.firstname} : #{article.title}"
  end
end
