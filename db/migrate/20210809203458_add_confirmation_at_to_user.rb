class AddConfirmationAtToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :confirmed_at, :datetime
  end
end
