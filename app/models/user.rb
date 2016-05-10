class User < ActiveRecord::Base
  validates :email,
  presence: true,
  uniqueness: {case_sensitive: false}

  validates :name,
  presence: true,
  length: { maximum: 20 }

  validates :password, presence: true, on: :create

  has_secure_password

  has_many :post
  
  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end

end
