class Post < ActiveRecord::Base
  validates :title,
  presence: true,
  length: {minimum: 10, maximum: 100},
  uniqueness: {case_sensitive: false}


  validates :link, presence: true,
   uniqueness: {case_sensitive: false},
   on: :create
end
