require 'spec_helper'


describe "abbs#index" do
    
    before :each do
        visit root_path 
    end
    
    it "should have a link to the blog" do
       page.should have_content("All Posts") 
    end
    
    it "should have have a p#main" do
       page.has_css?('p#main') 
    end
    
    it "has a pic of jdavison.jpg" do
        page.has_content?('jdavison.jpg')
    end
    
    
end