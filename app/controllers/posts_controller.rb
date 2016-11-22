class PostsController < ApplicationController
  before_action :is_authenticated, only: [:new, :create]
  

  def index
    @posts = Post.all.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save!
      session[:post_id] = @post.id
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    Post.find(params[:id]).delete
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :link, :user_id)
  end
end