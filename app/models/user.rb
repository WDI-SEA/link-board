class User < ActiveRecord::Base
	has_many :posts

	validates :name,
		presence: true,
		length: {maximum: 20},
		on: :create
	validates :password,
		presence: true,
		on: :create
	validates :email,
		presence: true,
		format: { with: /@/, message: "Is a valid e-mail"},
		uniqueness: {:case_sensitive => false}

	has_secure_password

	def self.authenticate(email, password)
		User.find_by_email(email).try(:authenticate, password)
	end

end
