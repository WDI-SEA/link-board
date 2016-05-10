class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
    Post.create post_params
    redirect_to posts_path
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find params[:id]
  end

  def show
    @post = Post.find params[:id]
    # render json: params
  end

  def update
    p = Post.find params[:id]
    p.update post_params
    redirect_to posts_path
  end

  def destroy
    Post.find(params[:id]).delete
    redirect_to posts_path
  end

  private

  def tweet_params
    params.require(:post).permit(:title, :link, :user)
  end
end
