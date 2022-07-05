class AddUserIdToArticles < ActiveRecord::Migration[7.0]
  def change
    add_reference :articles, :user, null: true, foreign_key: true
  end
end
