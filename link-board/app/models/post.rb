class Post < ActiveRecord::Base
  validates :title,
  presence: true,
  length: {in: 10..100}

  validates :link,
  presence: true

  validates_format_of :link, :with => URI::regexp(%w(http https))

  belongs_to :user
end