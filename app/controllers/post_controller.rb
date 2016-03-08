class PostController < ApplicationController
	before_filter :is_authenticated?,
		:only => :new
  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
  	new_post = Post.create(user_params)
  	flash[:success] = 'Post created'
  	redirect_to root_path
  end

  def user_params
  	params.require(:post).permit(:title, :link, :user)
  end
end
