class Post < ActiveRecord::Base
  belongs_to :user


  validates :title, presence: true
  validates :link, presence: true, length: {maximum: 100}, :format => URI::regexp(%w(http https))

end

