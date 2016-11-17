class User < ApplicationRecord
	has_many :posts

	validates :email,
	presence: true,
	uniqueness: {case_sensitive: false},
	format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

	validates :password,
	length: {in: 8..72},
	on: :create

	validates :name,
	presence: true,
	length: {in: 1..20}

	has_secure_password

	def self.authenticate(params)
		User.find_by_email(params[:email]).try(:authenticate, params[:password]);
	end

end
