class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def create
    post = Post.create post_params do |p|
      p.user_id = @current_user.user_id
      p.save
      redirect_to root_path
  end

  def new
    @post = Post.new
  end

  private
  def post_params
    params.require(:post).permit(:title, :link)
  end


end
