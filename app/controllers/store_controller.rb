class StoreController < ApplicationController
	skip_before_action :authorize
	include CurrentCart
	before_action :set_cart

	def index
		@categories = Category.all
		if params[:set_locale] 
			redirect_to store_url(locale: params[:set_locale])
		else
			@products = Product.order(created_at: :desc)
		end
	end

	def show 
		@category = Category.find(params[:id])
		@products = @category.products 
		if @products.any?
			@products = @category.products 
		else
			flash[:warning] = "Tidak ada produk untuk kategori #{@category.title}"
			redirect_to :back
		end
	end


	
end
