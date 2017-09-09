module CartsHelper
	#method for return cart.line_items.quantity
	def cart_quantity(line_items)
		line_items.to_a.sum { |item| item.quantity}
	end
end
