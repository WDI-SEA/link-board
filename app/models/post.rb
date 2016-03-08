class Post < ActiveRecord::Base
  belongs_to :user

  validates :title,
  presence: true

  validates :link,
  presence: true

  validates :user_id,
  presence: true,
  on: :create

end
