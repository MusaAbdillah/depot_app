class Province < ActiveRecord::Base
	# association 
	has_many :cities
	has_one :order, dependent: :destroy

	# get value from rajaongkir api
	def province 
	end


end
