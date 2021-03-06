class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_i18n_locale_from_params
  before_action :authorize

  include ApplicationHelper
  include SessionsHelper
  include CartsHelper
  include LineItemsHelper
  
  protected

  		#authorize method for multiple user
	  	def authorize
	  		unless User.find_by(id: session[:user_id])
	  			store_location
	  			flash[:warning] = "Silahkan masuk terlebih dahulu!"
	  			redirect_to login_url 
	  		end
	  	end

	  #method for internazionalisation
	  def set_i18n_locale_from_params
	  	if params[:locale]
		  	if I18n.available_locales.map(&:to_s).include?(params[:locale])
		  		I18n.locale = params[:locale]	
		  	else
		  		flash[:warning] = "#{params[:locale]} translation not available"
		  		logger.error flash.now[:notice]
		  	end
	  	end
	  end

	  #method for default translation
	  def default_url_options
	  	{locale: I18n.locale}
	  end

	  #method for current user already have admin previlage
	  def require_admin
	  	unless current_user.admin?
	  		flash[:warning] = "Anda harus punya akses admin untuk halaman ini!" 
	  		redirect_to admin_url
	  	end
	end 
end
