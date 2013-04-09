require 'spec_helper'

describe Tag do
  it "has a title" do
    tag = Tag.new
    tag.save.should == false
    tag.title = "ruby"
    tag.save.should == true
  end
end
