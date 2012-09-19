module ArticlesHelper
	def split_text(param)
		full_post = param.split("##")
		blog_copy = []
		full_post.each do |section|
			if section.match("!ruby")
				blog_copy << CodeRay.scan(section[5..-1], :ruby).html(  :wrap => nil, :line_numbers => :inline, :css => :style, :wrap => :div, :break_lines => true)
			elsif section.match("!copy")
				blog_copy << section[5..-1]
			end
		end
		blog_copy
	end
end
