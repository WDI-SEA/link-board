class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user_id = session[:user_id]
    if post.save
      flash[:success] = "Post created"
      redirect_to root_path
    else
      flash[:danger] = post.errors.messages
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :link, :user_id)
  end
end
