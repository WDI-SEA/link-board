class User < ActiveRecord::Base
  has_many :posts

  has_secure_password

  validates :name,
    presence: true,
    length: { in: 2...20 }

  validates :email,
    presence: true,
    uniqueness: {case_sensitive: false},
    email: true

  validates :password,
    length: { in: 8..72},
    on: :create

end
