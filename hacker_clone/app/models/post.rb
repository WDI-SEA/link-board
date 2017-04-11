class Post < ApplicationRecord
  belongs_to :user

  validates :title,
    presence: true

  validates :link, 
  presence: true
end
