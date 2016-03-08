class User < ActiveRecord::Base
	validates :password,
		presence: true
		
	validates :email,
		presence: true, 
		uniqueness: {:case_sensitive => false}
	
	validates :name, 
		presence: true, 
		length: { maximum: 19, too_long: "%{count} charcaters is too many." }
		
	has_secure_password

	def self.authenticate(email, password)  
		User.find_by_email(email).try(:authenticate, password)
	end
end
