class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :ratings, class_name: 'Vote'
  has_many :votes, as: :votable
end
