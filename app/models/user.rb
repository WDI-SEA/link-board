class User < ApplicationRecord
  has_many :posts

  validates :email,
  presence: true,
  uniqueness: {case_sensitive: false}

  validates :password,
  length: { in: 8..72 },
  on: :create

  validates :name,
  presence: true,
  length: { in: 1..29 }

  has_secure_password

  def self.authenticate(params)
    User.find_by_email(params[:email]).try(:authenticate, params[:password])
  end
end
