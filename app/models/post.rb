class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comment
  has_many :votes, as: :votable
  
  validates :title,
  presence: true,
  length: {minimum: 10, maximum: 100},
  uniqueness: {case_sensitive: false}


  validates :link, presence: true,
   uniqueness: {case_sensitive: false},
   on: :create
end
