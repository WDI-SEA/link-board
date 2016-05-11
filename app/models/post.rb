require 'uri'

class Post < ActiveRecord::Base
  validates :title,
    presence: true,
    length: { in: 2..100 }

  validates :link,
    presence: true,
    format: { with: URI.regexp }

  belongs_to :user
  has_many :comment
  has_many :votes, as: :votable
end
