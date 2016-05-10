class User < ActiveRecord::Base

  has_many :post

  validates :email, presence: true, uniqueness: {case_sensitive: false}

  validates :name, presence: true, length: { maximum: 19 }

  validates :password, presence: true, on: :create

  has_secure_password

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end

end
