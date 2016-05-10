require 'uri'

class Post < ActiveRecord::Base
  validates :title,
    presence: true,
    length: { in 10..100 }

  validates :link,
    presence: true,
    format: { with: URI.regexp }

  belongs_to :user
end
