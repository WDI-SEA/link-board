class PostsController < ApplicationController
  before_action :is_authenticated?

  def index
    @posts = Post.joins(:user)
    # @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    Post.create post_params
    redirect_to post_path
  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:title, :link)
  end
end
