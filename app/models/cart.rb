class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy



	# return add quantitiy product to cart if product already added otherwise add product
	def add_product(product_id)
		current_item = line_items.find_by(product_id: product_id) 
		if current_item
			current_item.quantity += 1
		else
			current_item = line_items.build(product_id: product_id)
		end
		return current_item
	end

	#method for current item total price line items 
	def total_price
		line_items.to_a.sum { |item| item.total_price }
	end

	#method for total price with go ject shipping
	def total_price_with_go_jek_cost
		total_price != 0 ? total_price + 15000 : total_price 
	end

	
end
