class Post < ActiveRecord::Base
  belongs_to :user

  validates :title,
  length: {:minimum => 10, :maximum => 100},
  presence: true

  validates :link,
  presence: true,
  :format => /\A#{URI::regexp(['http', 'https'])}\z/
end
