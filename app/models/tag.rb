class Tag < ActiveRecord::Base
  attr_accessible :title
  has_and_belongs_to_many :articles
  validates_presence_of :title

end
