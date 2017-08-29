module SessionsHelper

	#method for login user
	def login(user)
		session[:user_id] = user.id
	end

	#method for logout user
	def logout
		session[:user_id] = nil
	end

	#return current user and assingn it value to @current user using or equal to avoid multiple databases hited
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	#method redirect for frieldy url 
	def redirect_back_or(default)
		redirect_to(session[:forwarding_url] || default)
		session.delete(:forwarding_url)
	end

	#method for get url wish to acces by users using get action
	def store_location 
		session[:forwarding_url] = request.url if request.get?
	end


end
