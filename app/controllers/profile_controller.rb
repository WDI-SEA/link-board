class ProfileController < ApplicationController
	before_action :is_authenticated, only: [:index]
	before_action :current_user, only: [:index]

  def index
  	@posts = Post.all
  	@comments = Comment.all
  	@users = User.all
  end

end
