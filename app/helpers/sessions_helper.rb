module SessionsHelper
	#method for login user
	def login(user)
		session[:user_id] = user.id
	end
end
