class Topic < ActiveRecord::Base
  attr_accessible :title
  belongs_to_many :articles
end
