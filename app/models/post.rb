class Post < ActiveRecord::Base
  validates presense: true
  belongs_to :user
end
