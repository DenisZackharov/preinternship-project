class ArticleDecorator < ApplicationDecorator
  delegate :id, :title, :content, :tag_list, :status, :user_id, to: :article

  def article_link
    "#{user.firstname} : #{object.title}"
  end

  private

  def user
    @user ||= object.user
  end
end
