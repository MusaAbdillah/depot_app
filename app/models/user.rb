class User < ActiveRecord::Base
  #CONSTANTA FOR VALID EMAIL 
  REGEX_VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  #association 
  has_many :orders, dependent: :destroy

	after_destroy :ensure_an_admin_remains
  before_save :downcase_email, :titleize_name 

  validates :name, presence: true, uniqueness: true
  validates :phone, :email, :gender, presence: true
  validates :password, presence: true, length: {minimum: 6}
  validates :email, presence: true, format: {with: REGEX_VALID_EMAIL}, length: {maximum: 255}, uniqueness: {case_sensitive: false} 
  
  has_secure_password

  	private 
      #method for ensure that admin still ready on databases
  		def ensure_an_admin_remains
  			if User.count.zero?
  				raise "Can't delete last user"
  			end
  		end

      #method for downcase email 
      def downcase_email 
        self.email = email.downcase
      end

      #method for downcase name 
      def titleize_name 
        self.name = name.titleize
      end


end
