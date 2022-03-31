class ArticlePolicy < ApplicationPolicy

  def manage?
    @user&.id == @record.user_id
  end

  alias destroy? manage?
  alias update? manage?
end
