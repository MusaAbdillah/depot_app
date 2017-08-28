class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_i18n_locale_from_params
  before_action :authorize
  include SessionsHelper
  include ApplicationHelper

  	def require_admin
	  	unless current_user.admin?
	  		redirect_to admin_url
	  	end
	end


  protected
	  def authorize
	  	unless User.find_by(id: session[:user_id])
	  		redirect_to login_url, notice: "Please log in"
	  	end
	  end

	  def set_i18n_locale_from_params
	  	if params[:locale]
		  	if I18n.available_locales.map(&:to_s).include?(params[:locale])
		  		I18n.locale = params[:locale]	
		  	else
		  		flash.now[:notice] = "#{params[:locale]} translation not available"
		  		logger.error flash.now[:notice]
		  	end
	  	end
	  end

	  def default_url_options
	  	{locale: I18n.locale}
	  end
end
