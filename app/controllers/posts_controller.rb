class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
  	Post.create(post_params)
  	redirect_to posts_path
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	t = Post.find(params[:id])
  	t.update(post_params)
  	redirect_to posts_path
  end

  def show
  	@post = Post.find(params[:id])
  end

  def destroy
  	Post.find(params[:id]).delete
  	redirect_to posts_path
  end

  private

  def post_params
  	params.require(:post).permit(:title, :link, :user)
  end
end
