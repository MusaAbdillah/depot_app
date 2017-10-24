class Category < ActiveRecord::Base
	has_many :products
	before_save :sentence_case

	validates :title, presence: true


	private 
		def sentence_case
			self.title = self.title.downcase.titleize
		end

end
