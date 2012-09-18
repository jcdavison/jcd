class AddRubyCodetoArticle < ActiveRecord::Migration
	def change
  	add_column :articles, :ruby_code, :text
	end
end
