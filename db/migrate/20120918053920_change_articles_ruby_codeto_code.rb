class ChangeArticlesRubyCodetoCode < ActiveRecord::Migration
  def change
  	remove_column :articles, :ruby_code
  end
end
