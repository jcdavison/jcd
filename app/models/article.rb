class Article < ActiveRecord::Base
  
  attr_accessible :content, :title, :user_id
  belongs_to :user
  has_one :topic
  has_and_belongs_to_many :tags
  validates_presence_of :content, :title, :user_id
  accepts_nested_attributes_for :tags


end
