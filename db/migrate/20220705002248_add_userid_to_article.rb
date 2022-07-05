class AddUseridToArticle < ActiveRecord::Migration[7.0]
  def change
    add_reference :articles, :users
  end
end
