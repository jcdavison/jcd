module ArticlesHelper
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

	def check_blog_owner_status
		if user_signed_in? && current_user.email == "johncdavison@gmail.com"
			true
		else
			false
		end
	end
end
