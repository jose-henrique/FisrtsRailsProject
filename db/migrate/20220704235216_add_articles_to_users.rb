class AddArticlesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :articles, index: true, null: true
  end
end
