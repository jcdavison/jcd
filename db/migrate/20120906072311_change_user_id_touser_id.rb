class ChangeUserIdTouserId < ActiveRecord::Migration
  def change
      rename_column :articles, :User_id, :user_id
  end
end
