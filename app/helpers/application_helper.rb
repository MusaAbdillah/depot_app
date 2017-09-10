module ApplicationHelper

	#helper for hidden cart when empty
	def hidden_div_if(condition, attributes = {}, &block)
		if condition
			attributes['style'] = 'display: none'
		end
			content_tag("div", attributes, &block) 
	end

	#return base title if page title empty else otherwise
	def title(page_title = '')
		base_title = "AB Online Shop"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end

	#method for convert boolean yes or no instead true or false 
	def human_boolean(boolean_statement)
		boolean_statement ? "Yes" : "No"
	end

	#return 0 rupiah if line items is not ready or empty, using ternary statement
	def set_gojek_cost(line_items)
		line_items.any? ? 'Rp 15,000' : 'Rp 0'
	end

end
