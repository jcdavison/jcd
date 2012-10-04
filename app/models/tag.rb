class Tag < ActiveRecord::Base
  attr_accessible :title
  has_and_belongs_to_many :articles

  def clean_tags(tags)
    clean_tags = []
    tags.split("#").each {|tag| tag != "" ? clean_tags << tag : nil }
    clean_tags
  end
end
