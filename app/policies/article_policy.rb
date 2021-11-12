class ArticlePolicy < ApplicationPolicy
  def author?
    @user.id == @record.user_id
  end
end
