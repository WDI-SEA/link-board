class Comment < ActiveRecord::Base
	belongs to :user
	has_many :votes, as: :votable

end
