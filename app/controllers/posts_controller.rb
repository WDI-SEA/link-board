class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    post = @current_user.posts.create(post_params)
    flash[:success] = 'New post created'
    redirect_to root_path
  end

  def index
    @posts = Post.all
  end

  private
  def post_params
    params.require(:post).permit(:title, :link)
  end
end
