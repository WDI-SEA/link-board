class User < ActiveRecord::Base
  validates :email, email: true,
  presence: true,
  uniqueness: {case_sensitive: false}

  has_secure_password

  def self.authenticate email, password
  User.find_by_email(email).try(:authenticate, password)
   has_many :post
  end
end
