class CommentsPosts < ApplicationRecord
  belongs_to :comment
  belongs_to :post
end
