class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def create
    post = Post.create post_params
    redirect_to root_path
  end

  def new
  end

  private
  def post_params
    params.require(:post).permit(:title, :link, :user_id)
  end


end
