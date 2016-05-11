class User < ActiveRecord::Base
  has_many :post
  has_many :ratings, class_name: 'Vote'
  has_many :votes , as: :votable

  validates :email,
  presence: true,
  uniqueness: {case_sensitive: false}

  validates :password,
   presence: true,
   on: :create

  has_secure_password


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, presence: true, length: { maximum: 105 },
    uniqueness: {case_sensitive: false},
    format: { with: VALID_EMAIL_REGEX}


  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)    
  end

end
