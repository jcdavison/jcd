class Article < ActiveRecord::Base
  
  attr_accessible :content, :title, :user_id
  belongs_to :user
  validates_presence_of :content, :title, :user_id
  # before_save :validate_article_owner
  # before_create :validate_article_owner
  # before_update :validate_article_owner
  # before_destroy :validate_article_owner


  private

  # def validate_article_owner
  # 	audit params
  # end


end
