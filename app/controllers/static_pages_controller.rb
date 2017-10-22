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
	      flash[:success] = 'Berhasil Masuk!'
	  	else
	      flash[:danger] = 'Kombinasi user/password salah!'
	  	end
	  end
end
