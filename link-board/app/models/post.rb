class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  has_and_belongs_to_many :tags

  validates :title,
  presence: true,
  length: {in: 10..100}
end
