class User < ApplicationRecord

	has_many :posts
	has_many :comments
	has_many :upvotes
	has_many :downvotes

	validates :email,
	presence: true,
	uniqueness: {case_sensitive: false}

	validates :password,
	length: {in: 6..30},
	on: :create

	validates :name,
	length: {in: 0..30}

	has_secure_password

	def self.authenticate(params)
		user = User.find_by_email(params[:email])
		puts user.inspect
		user.try(:authenticate, params[:password]);
	end
end
