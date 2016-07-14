class Post < ApplicationRecord
  belongs_to :user

  validates :title, 
    presence: true,
    length: { in: 10..100 },
    on: :create

  validates :link, 
    presence: true,
    on: :create,
    url: true

end
