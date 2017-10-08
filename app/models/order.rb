class Order < ActiveRecord::Base
	#assocition
	has_many :line_items, dependent: :destroy
	belongs_to :user
	belongs_to :province
	belongs_to :city

	accepts_nested_attributes_for :user, :province, :city

	#validates
	validates :name, :phone, :address, :pos_code, :email, :pay_type, presence: true

	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end

end





