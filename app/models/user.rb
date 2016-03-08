class User < ActiveRecord::Base
    has_many :posts

    validates :password_digest,
        presence: true,
        on: :create
    validates :email,
        presence: true,
        uniqueness: {:case_sensitive => false}
    has_secure_password

    def self.authenticate(email, password)
        User.find_by_email(email).try(:authenticate, password)
    end
end
