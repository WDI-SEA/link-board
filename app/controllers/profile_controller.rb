class ProfileController < ApplicationController
	before_action :is_authenticated, only: [:index]
	before_action :current_user, only: [:index]

  def index
  	@posts = Post.all
  	@comments = Comment.all
  	@users = User.all
  end

  def destroy
   	Post.find(params[:id]).delete
   	redirect_to '/profile'
  end

end
