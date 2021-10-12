class ArticleDecorator < ApplicationDecorator
  delegate_all

  def article_link
    "#{user.firstname} : #{title}"
  end
end
