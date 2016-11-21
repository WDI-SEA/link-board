class User < ApplicationRecord
  has_many :comments
  has_many :posts
  accepts_nested_attributes_for :posts
  accepts_nested_attributes_for :comments
  
  validates :name,
  presence: true,
  length: {in: 3..20}

  validates :email,
  presence: true,
  uniqueness: {case_sesitive: false}

  validates :password,
  length: {in: 8..25},
  on: :create

  has_secure_password

  def self.authenticate(params)
    User.find_by_email(params[:email]).try(:authenticate, params[:password]);
  end
end
