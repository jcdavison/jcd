require 'CodeRay'
require 'rspec'

blog_post = "\r\n!copy\r\n\r\n<p>this is html</p>\r\n\r\n##\r\n!ruby\r\n\r\n\r\ndef method1\r\n    puts \"method1\"\r\nend\r\n##"
correctly_processed_blog_post = "<p>this is html</p><div class=\"CodeRay\">\n  <div class=\"code\"><pre><span class=\"line-numbers\"><a href=\"#n1\" name=\"n1\">1</a></span><span style=\"color:#080;font-weight:bold\">def</span> <span style=\"color:#06B;font-weight:bold\">method1</span>\n<span class=\"line-numbers\"><a href=\"#n2\" name=\"n2\">2</a></span>    puts <span style=\"background-color:hsla(0,100%,50%,0.05)\"><span style=\"color:#710\">&quot;</span><span style=\"color:#D20\">method1</span><span style=\"color:#710\">&quot;</span></span>\n<span class=\"line-numbers\"><a href=\"#n3\" name=\"n3\">3</a></span><span style=\"color:#080;font-weight:bold\">end</span></pre></div>\n</div>\n"

def sift_snippets(blog_post)
	sifted_contents = blog_post.split("##")
	sifted_contents
end

def process_ruby(ruby_pre_process)
	ruby_post_process = ruby_pre_process.collect do |section|
		if section.match(/!ruby/)
			section.sub!(/!ruby/,"")
			run_coderay(section.strip)
		else
			section
		end
	end
	ruby_post_process
end

def run_coderay(content)
	CodeRay.scan(content, :ruby).html(  :wrap => nil, :line_numbers => :inline, :css => :style, :wrap => :div, :break_lines => true)
end

def process_copy(ruby_post_process)
	copy_post_process = ruby_post_process.collect do |section| 
		if section.match(/!copy/)
			section.sub!(/!copy/,"").strip
		else
			section
		end
	end
	copy_post_process
end

def return_article_content(blog_post)
	process_copy(process_ruby(sift_snippets(blog_post))).join
end





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