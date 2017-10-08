# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
=begin	require 'uri'
	require 'net/http'
	require 'openssl'
	require 'json'


	url = URI("https://api.rajaongkir.com/starter/city")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["key"] = '2e2597d10cfb3b707a8c678632ddfdff'

    response = http.request(request)
    city = JSON.parse(response.read_body)

    city['rajaongkir']['results'].each do |n| 
    	City.create!(province: n['province'],
    				city_name: n['city_name'],
    				postal_code: n['postal_code'],
    				tipe: n['type'],	
    				province_id: n['province_id'] )
    end =end