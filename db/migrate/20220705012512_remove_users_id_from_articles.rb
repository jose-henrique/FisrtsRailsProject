class RemoveUsersIdFromArticles < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :users_id, :integer
  end
end
