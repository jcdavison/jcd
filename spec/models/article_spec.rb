require 'spec_helper'

describe Article do

   before :each do 
      @article = create(:article)
      @user = create(:user)
   end

   it "has an associated user" do
      @article.user_id = nil 
      @article.save.should == false
      @article.user_id = @user.id
      @article.save.should == true
   end

   it "replaces ' ' with '_' in title" do
     @article.clean_title.match(" ").should be_nil
   end

   it "calls clean_title before save" do
     @article.should_receive(:clean_title)
     @article.save
   end

   context "adds tags to an Article" do

     context "#add_tags" do

       it { @article.should respond_to :add_tags }

       it "creates a new association for each unique tag" do
         @tags = "#ruby#rails#javascript"
         @article.add_tags(@tags)
         @article.tags.count.should == 3
       end

       it "creates a new new record for any new tag" do
         @tags = "#ruby#rails#javascript"
         @article.add_tags(@tags)
         Tag.count.should == 3
       end

       it "creates an association but not a record for tags that already exist" do
         Tag.create( title: "ruby")
         @tags = "#ruby#rails#javascript"
         @article.add_tags(@tags)
         @article.tags.count.should == 3
       end

       it "does not create duplicate records or associations" do
         Tag.create( title: "ruby")
         @tags = "#ruby#ruby"
         @article.add_tags(@tags)
         @article.tags.count.should == 1
       end

       it "returns false if an emptry tags object is added" do
         @tags = nil
         @article.add_tags(@tags).should == false
       end

     end

   end

end
