class Category < ActiveRecord::Base
	has_many :products
	before_save :sentence_case


	private 
		def sentence_case
			self.title = self.title.downcase.titleize
		end

end
