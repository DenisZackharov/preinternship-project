class AddDefaultForStatus < ActiveRecord::Migration[6.1]
  def change
    change_column_default :articles, :status, from: nil, to: "drafted"
  end
end
