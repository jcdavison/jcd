require 'spec_helper'

describe Tag do
  context "Tag" do
    context "#clean_tags" do
      it "should return tags cleaned of hash marks and blanks" do
        tag = Tag.new
        tags_param = "#ruby#js#lifehacks"
        tag.clean_tags(tags_param).should == ["ruby", "js", "lifehacks"]
      end
    end
  end 
end
