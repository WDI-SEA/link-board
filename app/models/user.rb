class User < ActiveRecord::Base
	has_many :posts

	# has_many :ratings, class_name: 'Vote',

	validates :name,
	length: {minimum: 2},
	length: {maximum: 20}

	validates :password,
		presence: true,
		on: :create
	validates :email,
		:format => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
		presence: true,
		uniqueness: {:case_sensitive => false}



has_secure_password		

	def self.authenticate(email, password)
		User.find_by_email(email).try(:authenticate, password)
	end

end
