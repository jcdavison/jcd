class Article < ActiveRecord::Base
  
  attr_accessible :content, :title, :user_id
  belongs_to :user
  has_and_belongs_to_many :tags
  validates_presence_of :content, :title, :user_id
  accepts_nested_attributes_for :tags
  before_save :clean_title

  def add_tags(tags)
    return false if tags == nil
    tags.split("#").each do |tag|
      next if tag.empty?
      tag.downcase!

      if ! Tag.find_by_title(tag)
        self.tags << Tag.create(title:tag)
      elsif self.tags.where("title = ?", tag).empty?
        self.tags << Tag.find_by_title(tag)
      end
    end
  end

  def clean_title
    self.title = title.gsub(" ", "_")
  end
end
