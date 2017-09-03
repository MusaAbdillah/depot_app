class StaticPagesController < ApplicationController


	skip_before_action :authorize

	  def question
	  end

	  def news
	  end

	  def contact
	  end

	  def create
	  	email = params[:email]
	  	content = params[:content]
	  	if !email.empty? && !content.empty!
	      flash[:success] = 'Login successfully!'
	  	else
	      flash[:danger] = 'Invalid user/password combination'
	  	end
	  end
end
