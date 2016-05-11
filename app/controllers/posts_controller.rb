class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    post = Post.create post_params do |p|
      p.user_id = @current_user.id
      p.save
    end
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
    @comments = Comment.all
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

  def post_params
    params.require(:post).permit(:title, :link)
  end
end

