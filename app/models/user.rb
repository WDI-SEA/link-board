class User < ActiveRecord::Base
  has_many :posts

  has_secure_password

  validates :name,
  presence: true,
  length: { in: 1...20 },
  on: :create

  validates :email,
  email: true,
  uniqueness: { case_sensitive: false }

  validates :password,
  length: { in: 8..72 },
  on: :create

  def self.authenticate(params)
    User.find_by_email(params[:email]).try(:authenticate, params[:password])
  end
end
