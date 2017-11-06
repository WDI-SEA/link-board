class Post < ApplicationRecord
  belongs_to :user

  validates :title,
  presence: true,
  length: (5..80),
  on: :create

  validates :link,
  presence: true,
  on: :create

end
