class User < ActiveRecord::Base
  validates :email,
  presence: true,                     
  uniqueness: {case_sensitive: false},  
  email: true                        

  validates :password,
  presence: true,
  on: :create

  validates :name,
  presence: true,
  length: {maximum: 20},
  uniqueness: {case_sensitive: false}

  has_secure_password

  has_many :post

  def self.authenticate name, password
    User.find_by_name(name).try(:authenticate, password)
  end
end