class User < ActiveRecord::Base
  has_many :post
  #ratings is an instance of the Class Vote 
  has_many :ratings, class_name: 'Vote'
  has_many :votes, as: :votable

  validates :email,
  presence: true,
  uniqueness: {case_sensitive: false}

  validates :password, presence: true, on: create

  validates :email, email: {strict_mode: true}

  has_secure_password

  validates :name, presence: true, length: {maximum: 20}

  has_many :post

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end

end
