require 'spec_helper'

describe "articles#index" do
    
    before :each do
        visit articles_path
    end
    
    it "should have a list of blog entries" do
        page.should have_css('section .title')
        page.should have_css('section .content')            
    end
    
end