class User < ApplicationRecord
  validates :email,
  presence: true,
  uniqueness: {case_sensitive: false}

  has_secure_password

  def self.authenticate(params)
    User.find_by_email(params[:email]).try(:authenticate, params[:password])
  end
end
