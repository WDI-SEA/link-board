class Post < ApplicationRecord
    belongs_to :user

    validates :title,
    presence: true,
    length: (10..100),
    on: :create

    validates :link,
    url: true,
    presence: true,
    on: :create

end
