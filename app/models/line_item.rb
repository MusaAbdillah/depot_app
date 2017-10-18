class LineItem < ActiveRecord::Base
	# association
	belongs_to :order
	belongs_to :product
	belongs_to :cart
  	
  	#return total price
	def total_price 
		product.price * quantity
	end
  
end
