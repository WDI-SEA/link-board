class Post < ApplicationRecord
  belongs_to :user

  has_many :comments

  validates :title,
  presence: true

  validates :link,
  presence: true,
  length: {in: 10..100}

  has_reputation :votes, source: :user, aggregated_by: :sum

end
