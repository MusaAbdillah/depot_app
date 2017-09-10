module LineItemsHelper

	#method for total price with go ject shipping
	def grand_total_price_with_go_jek_cost(line_items)
		total_price = line_items.to_a.sum { |item| item.total_price }
		total_price != 0 ? total_price + 15000 : 0 
	end

end
