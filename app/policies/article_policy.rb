class ArticlePolicy < ApplicationPolicy
  def manage?
    @user&.id == @record.user_id
  end
end
