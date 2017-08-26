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

	#return current user and assingn it value to @current user using or equal to avoid multiple databases hited
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end
end
