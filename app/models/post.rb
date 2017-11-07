class Post < ApplicationRecord
  belongs_to :user

  validates :link,
    :presence => true,
    :format => URI::regexp(%w(http https))

  validates :title,
    :presence => true,
    :length => {in: 10..100 }

end
