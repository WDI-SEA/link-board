class User < ApplicationRecord
  has_many :posts
  has_many :comments

  validates :email,
  presence: true,
  uniqueness: {case_sensitive: false}

  validates :name,
  presence: true,
  length: {in: 3..20}

  validates :password_digest,
  length: {in: 3..32},
  on: :create

  def self.authenticate(params)
    User.find_by_email(params[:email]).try(:authenticate, params[:password_digest])
  end
end
