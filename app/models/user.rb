class User < ActiveRecord::Base
	has_many :posts
	has_many :comments

	validates :name,
		presence: true,
		length: { in: 2..20 }

	validates :password,
		presence: true,
		length: { in: 8..15 },
		on: :create

	validates :email,
		email: { strict_mode: true },
		uniqueness: {:case_sensitive => false}

	has_secure_password

	def self.authenticate(email, password)
		User.find_by_email(email).try(:authenticate, password)
	end
end
