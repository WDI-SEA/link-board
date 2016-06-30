class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :ratings, class_name: "Vote"
  has_many :votes, as: :votable
end


