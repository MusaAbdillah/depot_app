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



# require 'uri'
# require 'net/http'

# url = URI("https://api.rajaongkir.com/starter/province")

# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE

# request = Net::HTTP::Get.new(url)
# request["key"] = '2e2597d10cfb3b707a8c678632ddfdff'

# response = http.request(request)
# puts response.read_body

# require 'uri'
# require 'net/http'

# url = URI("https://api.rajaongkir.com/starter/city?id=39&province=5")

# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE

# request = Net::HTTP::Get.new(url)
# request["key"] = '2e2597d10cfb3b707a8c678632ddfdff'

# response = http.request(request)
# puts response.read_body

# require 'uri'
# require 'net/http'

# url = URI("https://api.rajaongkir.com/starter/cost")

# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE

# request = Net::HTTP::Post.new(url)
# request["key"] = '2e2597d10cfb3b707a8c678632ddfdff'
# request["content-type"] = 'application/x-www-form-urlencoded'
# request.body = "origin=501&destination=114&weight=1700&courier=jne"

# response = http.request(request)
# puts response.read_body

