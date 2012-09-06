require 'spec_helper'

describe "Article should" do
   
   before :each do 
      @article = Article.new(user_id:1, content: "lakdjflakdjfa dflakjsd", title: "some random stuff" ) 
   end 
   
   it "should have an associated user" do
      @article.should be_valid 
   end
   
    
end
