class SessionsController < ApplicationController
  skip_before_action :authorize
  
  def new
  end

  def create
  	user = User.find_by(email: params[:email])
  	if user && user.authenticate(params[:password])
  		login user 
      flash[:success] = "#{user.name} Berhasil Masuk!"
      redirect_back_or user
  	else
      flash[:danger] = 'Invalid user/password combination'
  		redirect_to login_url
  	end
  end

  def destroy
  	logout
    flash[:danger]  = "Anda Berhasil Keluar!"
  	redirect_to store_url
  end

end
