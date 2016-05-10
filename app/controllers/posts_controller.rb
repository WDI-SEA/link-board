class PostsController < ApplicationController
  before_action :is_authenticated?

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new post_params
    post.save!
    flash[:success] = "Post created!"
    
    redirect_to root_path
  end

  private

  def post_params 
    return params.require(:post).permit(:title, :link, :user_id)
  end
end
