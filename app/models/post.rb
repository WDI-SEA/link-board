class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comment
  has_many :votes, as: :votable

  validates :title,
  length: {:minimum => 10, :maximum => 100},
  presence: true

  validates :link,
  presence: true,
  :format => /\A#{URI::regexp(['http', 'https'])}\z/
end
