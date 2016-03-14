class User < ActiveRecord::Base
	has_many :post

	validates :email,
	# valid email
	email: true,
	# unique
	uniqueness: {case_sensitive: false},
	# required
	presence: true


	validates :name,
	length: {maximum: 20},
	presence: true

	has_secure_password

	def self.authenticate(email, password)
		User.find_by_email(email).try(:authenticate, password)
	end
end


# user.email
# required
# valid email
# unique
# user.name
# required
# less than 20 chars

# Create User model
# add has_secure_password and validations
# enable bcrypt gem in Gemfile
# migrate rake db:migrate
# test using rails c (User.all, User.create, etc)
# Test validations by violating them and adjust if needed
# Create authentication routes / controller / actions / views
# Test that you can signup and log in / out
