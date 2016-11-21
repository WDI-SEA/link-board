class PostsController < ApplicationController
  before_action :is_authenticated, only: [:new, :create]
  before_action :current_user, only: [:index]
  
  def index
    @posts = Post.all
    @users = User.all
    @comments = Comment.all
  end

  def new
    @post = Post.new
  end

  def create
    @current_user.posts.create(post_params)
    redirect_to root_path
  end

  def destroy
    Post.find(params[:id]).delete
    redirect_to posts_path
  end
  private

  def post_params
    params.require(:post).permit(:title, :link)
  end

  def modal
    respond_to do |format|
      format.html
      format.js
    end
  end
end

