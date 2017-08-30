class User < ActiveRecord::Base
	after_destroy :ensure_an_admin_remains
  validates :name, presence: true, uniqueness: true
  validates :phone, :email, :gender, presence: true
  has_secure_password

  	private 
      #method for ensure that admin still ready on databases
  		def ensure_an_admin_remains
  			if User.count.zero?
  				raise "Can't delete last user"
  			end
  		end


end
