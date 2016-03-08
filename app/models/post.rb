class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comment
  has_many :votes, as: :votable

  validates :title,
  	presence: true,
  	length: {in: 10..100},
  	on: :create
  validates :link,
  	presence: true,
  	# url: true,
  	on: :create
  	
end
