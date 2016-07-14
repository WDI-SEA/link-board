class Post < ApplicationRecord
  belongs_to :user

  validates :title, length: { in: 4..72 }, on: :create
  validates :link, :url => true

  
end
