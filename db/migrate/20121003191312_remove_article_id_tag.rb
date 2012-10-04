class RemoveArticleIdTag < ActiveRecord::Migration
  def change
    remove_column :tags, :article_id
  end
end
