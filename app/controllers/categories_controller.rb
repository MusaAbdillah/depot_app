class CategoriesController < ApplicationController
	before_action :set_category, only: [:edit, :update]
	before_action :require_admin

	def index 
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create 
		@category = Category.new(category_params)
		respond_to do |format|
		  if @category.save
		    format.html { redirect_to store_url }
		    flash[:success] = "Product category created!"
		  else
		    format.html { render :new }
		  end
		end
	end

	def edit 
	end

	def update 
		respond_to do |format|
			if @category.update_attributes(category_params)
				flash[:success] = "Category Product updated!"
				format.html { redirect_to categories_path }
			else
				render 'edit'
			end
		end
	end

	private 
		def category_params
			params.require(:category).permit(:title)
		end

		def set_category
			@category = Category.find(params[:id])
		end
end
