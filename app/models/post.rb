class Post < ApplicationRecord
  belongs_to :user

  validates :title,
  length: {in: 10..100}

  # validates :link, :format => URI::regexp(%w(http https))

end
