class AddUserIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :User_id, :integer
  end
end
