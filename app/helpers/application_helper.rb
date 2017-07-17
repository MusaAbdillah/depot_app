module ApplicationHelper

	#helper for hidden cart when empty
	def hidden_div_if(condition, attributes = {}, &block)
		if condition
			attributes['style'] = 'display: none'
		end
		content_tag("div", attributes, &block)
	end
end
