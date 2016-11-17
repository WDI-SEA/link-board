class User < ApplicationRecord
  has_many :posts

  validates :email,
  presence: true, 
  uniqueness: {case_sensitive: false}

  validates :password,
  length: {in: 8..30}, 
  on: :create 

  validates :name,
  length: {in: 3..20}

  has_secure_password

  def self.authenticate(params)
    User.find_by_email(params[:email]).try(:authenticate, params[:password])
  end

end
