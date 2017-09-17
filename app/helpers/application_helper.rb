require 'uri'
require 'net/http'
require 'openssl'
require 'json'

module ApplicationHelper

	#helper for hidden cart when empty
	def hidden_div_if(condition, attributes = {}, &block)
		if condition
			attributes['style'] = 'display: none'
		end
			content_tag("div", attributes, &block) 
	end

	#return base title if page title empty else otherwise
	def title(page_title = '')
		base_title = "AB Online Shop"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end

	#method for convert boolean yes or no instead true or false 
	def human_boolean(boolean_statement)
		boolean_statement ? "Yes" : "No"
	end

	#return 0 rupiah if line items is not ready or empty, using ternary statement
	def set_gojek_cost(line_items)
		line_items.any? ? 'Rp 15,000' : 'Rp 0'
	end

	# def rajaongkir(destination, weight = 1000, courier = 'jne')
	# 	begin 
	# 		url = URI("http://api.rajaongkir.com/starter/cost")
	# 		request = Net::HTTP::POST.new(url)
	# 		request['key'] = ENV["RO_API_KEY"]
	# 		request['content-type'] = 'application/x-www-form-urlencoded'
	# 		request.body = "origin=501&destination=#{destination}&weight=#{weight}&courier=#{courier}"
	# 		body = JSON.parse(Net::HTTP.new(url.host, url.port).request(request).read_body)
	# 		if body['rajaongkir']['status']['code'] == 200
	# 			if body['rajaongkir']['results'][0]['costs'][0].nil?
	# 				nil
	# 			else
	# 				body['rajaongkir']['results'][0]['costs'][0]['costs'][0]['value']
	# 			end
	# 		else
	# 			false
	# 		end
	# 	rescue 
	# 		false
	# 	end
	# end


end
