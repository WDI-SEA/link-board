class User < ApplicationRecord

  validates :email,
  presence: true,
  uniqueness: {case_sensitive: false} 

  validates :name,
  length: {in: 1..20},
  on: :create 


  validates :password,
  length: {in: 10..100},
  on: :create 

  has_secure_password

  def self.authenticate(params)
    User.find_by_email(params[:email]).try(:authenticate, params[:password])
  end
end
