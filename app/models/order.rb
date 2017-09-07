class Order < ActiveRecord::Base
	#assocition
	has_many :line_items, dependent: :destroy
	belongs_to :user

	#validates
	validates :name, :phone, :address, :pos_code, :email, :pay_type, presence: true

	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end

	#method for current item total price line items 
	def total_price_line_items
		line_items.to_a.sum { |item| item.total_price }
	end

	#return total price on line_items adding with go jek shipping cost
	def final_price_with_gojek_shipping_cost
		total_price_line_items + 15000
	end

	
end
