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

end





