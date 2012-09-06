class Article < ActiveRecord::Base
  attr_accessible :content, :title, :user_id
  belongs_to :user
  validates_presence_of :content, :title, :user_id
end
