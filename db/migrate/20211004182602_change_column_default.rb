class ChangeColumnDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :articles, :status, from: "drafted", to: "draft"
  end
end
