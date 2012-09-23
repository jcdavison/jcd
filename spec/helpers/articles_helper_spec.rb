require 'spec_helper'


describe "Snippet" do
	
	context "#sift_snippets" do

		it "should separate blog copy and ruby code" do
			sift_snippets(blog_post).each {|text| text.should match(/!ruby|!copy/)}
		end

	end

	context "#process_ruby" do

		it "should run the ruby code through the CodeRay Processor" do
			process_ruby(sift_snippets(blog_post)).each {|section| section.should match(/!copy|CodeRay/)}
		end
		it "should remove any reference to !ruby in the output" do
			process_ruby(sift_snippets(blog_post)).each {|section| section.should_not match(/!ruby/)}
		end

	end

	context "#process_copy" do
		it "should remove any reference to !copy in the output" do
			process_copy(process_ruby(sift_snippets(blog_post)).each {|section| section.should_not match(/!ruby/)}).each {|section| section.should_not match(/!copy/)}
		end
	end

	context "#return_article_content" do
		it "should return a correctly formed string to the browser" do
			return_article_content(blog_post).should eq correctly_processed_blog_post
		end
	end

end

