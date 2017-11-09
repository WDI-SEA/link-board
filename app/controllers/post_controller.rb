class PostController < ApplicationController
  def index
  	@posts = Post.all
  	@user = current_user
  end

  def new
  	@user = current_user
  	@userId = @user.id
  end

  def create
  	@user = current_user
  	@userId = @user.id
  	@post = Post.create(post_params)
  	@user.posts << @post
  	redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end


  def post_params
	  params.require(:post).permit(:title, :link, :comment_ids => [])
	end
end
