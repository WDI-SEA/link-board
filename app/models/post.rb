class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comment
  acts_as_votable
end
