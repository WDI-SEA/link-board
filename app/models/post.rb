class Post < ActiveRecord::Base
  validates :title,
  presence: true,
  length: { in: 10..100 }

  validates :link,
  presence: true,
  length: { in: 10..100 },
  :url => true

  belongs_to :user
end
