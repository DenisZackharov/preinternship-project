class ArticleDecorator < ApplicationDecorator

  def article_link
    "#{user.firstname} : #{object.title}"
  end

  private

  def user
    @user ||= object.user
  end
end
