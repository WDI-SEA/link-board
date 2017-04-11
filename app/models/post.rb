class Post < ApplicationRecord
  belongs_to :user

  validates :title,
  presence: true,
  length: {in: 10..100}

  validates :link,
  presence: true
  

end
