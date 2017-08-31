class SessionsController < ApplicationController
  skip_before_action :authorize
  
  def new
  end

  def create
  	user = User.find_by(name: params[:name])
  	if user && user.authenticate(params[:password])
  		login user 
      flash[:success] = 'Login successfully!'
      redirect_back_or user
  	else
      flash[:danger] = 'Invalid user/password combination'
  		redirect_to login_url
  	end
  end

  def destroy
  	logout
    flash[:danger]  = "Logged out successfully!"
  	redirect_to store_url
  end

end
