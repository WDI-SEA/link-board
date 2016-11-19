class PostsController < ApplicationController
  before_action :is_authenticated, only: [:new, :create]
  before_action :current_user, only: [:index, :show]
  def index
  
  end

  def new
  	@post = Post.new
  end

  def create
  	@current_user.posts.create(post_params)
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id]) 
    @comment_new = Comment.new
    @comments = Comment.where(post_id: params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    t = Post.find(params[:id])
    t.update(post_params)
    redirect_to posts_path
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
