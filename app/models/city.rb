class City < ActiveRecord::Base
	belongs_to :province
	has_one :order, dependent: :destroy	
end
