class PostController < ApplicationController
  def index
  	@posts = Post.all
  	@user = current_user
  end

  def new
  	@user = current_user
  	@userId = @user.id
  	puts @userId
  end

  def create
  	@user = current_user
  	@userId = @user.id
  	@post = Post.create(post_params)
  	@user.posts << @post
  	redirect_to root_path
  end

  def post_params
	  params.require(:post).permit(:title, :link, user_id: current_user)
	end
end
