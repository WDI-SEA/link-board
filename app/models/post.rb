class Post < ActiveRecord::Base
  validates :title,
  presence: true,
  length: { in: 10..100 }

  validates :link,
  presence: true,
  length: { in: 10..100 }

  belongs_to :user
end
