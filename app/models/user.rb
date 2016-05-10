class User < ActiveRecord::Base
  validates :email, 
    email: true, 
    presence: true, 
    uniqueness: {case_sensitive: false}
  
  validates :password, 
    presence: true, 
    on: :create
  
  validates :name,
    presence: true,
    length: { maximum: 20 } 

  has_secure_password

  has_many :post

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end
end



