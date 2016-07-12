class PostsController < ApplicationController
  before_action :is_authenticated, only: [:new]

  def index
    @posts = Post.first(limit=10)
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    if post.save
      flash[:success] = "Successfully Shared A Link!"
      redirect_to root_path
    else
      flash[:danger] = "Failed to post link. Check your fields"
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :link, :user_id)
  end
end
