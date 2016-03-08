class PostsController < ApplicationController
	before_filter :is_authenticated?,
	:except => :index

  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
    Post.create post_params
    redirect_to root
  end

  private
    def post_params
      params.require(:post).permit(:title, :url, :user_id)
    end


end
