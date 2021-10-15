class FilteredArticlesQuery < BaseQuery
  private
  def by_status(relation, value)
    relation.where(status: value)
  end
end
