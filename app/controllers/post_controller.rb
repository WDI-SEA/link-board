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
  	@current_user.posts.create(post_params)
  	flash[:success] = 'Post created'
  	redirect_to root_path
  end

  def post_params
  	params.require(:post).permit(:title, :link)
  end
end
