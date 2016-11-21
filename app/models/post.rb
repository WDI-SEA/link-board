class Post < ApplicationRecord
  has_many :comments
  belongs_to :user
  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :comments
  acts_as_votable
end
