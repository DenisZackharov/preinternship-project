class ArticlePolicy < ApplicationPolicy

  def edit?
    author?
  end
  alias destroy? edit?
  alias update? edit?

    private

  def author?
    @user&.id == @record.user_id
  end
end
