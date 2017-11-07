class User < ApplicationRecord

  has_many :posts

  validates :email,
    presence: true,
    email: true,
    uniqueness: {
      case_sentitive: false
    }

  validates :password,
    length: { in: 7..33 },
    on: :create

  validates :name,
    presence: true,
    length: { in: 1..20 }

  has_secure_password

  def self.authenticate(params)
    User.find_by_email(params[:email]).try(:authenticate, params[:password])
  end
end
