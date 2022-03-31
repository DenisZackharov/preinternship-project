class ArticleDecorator < ApplicationDecorator
  delegate :id, :title, :content, :tag_list, :status, :user_id, :user, to: :article

  def self.collection_decorator_class
    PaginatingDecorator
  end

  def article_link
    "#{user.firstname} : #{object.title}"
  end
end
