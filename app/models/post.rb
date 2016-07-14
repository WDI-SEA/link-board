class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: { in: 3..64}, on: :create
  validates :link, presence: true, on: :create
end
