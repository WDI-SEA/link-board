class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }

  # 'on' defines when this validation runs ('on: update' is another option)
  validates :password, length: { in: 8..72 }, on: :create

  # self refers to the current class
    def self.authenticate(params)
      User.find_by_email(params[:email]).try(:authenticate, params[:password])
    end
end
