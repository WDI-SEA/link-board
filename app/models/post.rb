class Post < ActiveRecord::Base
  belongs_to :user
  has_many :votes, as: :votable 

  validates :title,
  length: { in: 10..100},
  # required
  presence: true

  validates :link,
  #required
  presence: true,
  #valid link
  :url => true

end


# post.title
# required
# should be between 10 and 100 chars
# post.link
# required
# should be a valid url