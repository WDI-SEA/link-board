class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :upvotes
  has_many :downvotes
end
