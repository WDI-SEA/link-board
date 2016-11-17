class User < ApplicationRecord

	validates :email,
	presence: true,
	uniqueness: {case_sensitive: false}

	validates :password,
	length: {in: 6..30},
	on: :create

	validates :name,
	length: {in: 0..30}

	has_secure_password
end
