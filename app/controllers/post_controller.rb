class PostController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = Post.new
    puts('Posts...', @currentUser)
  end

  def create
    Post.create(post_params)
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    p = Post.find(params[:id])
    p.update(post_params)
    redirect_to '/'
  end

  def destroy
    Post.find(params[:id]).delete
    redirect_to '/'
  end

  private
  def post_params
    params.require(:post).permit(:title, :link, :user_id)
  end
end
