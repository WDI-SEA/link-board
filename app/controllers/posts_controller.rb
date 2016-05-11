class PostsController < ApplicationController
  before_action :is_authenticated?, only: [:new, :create]

  def index
    @posts = Post.all
    @users = User.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new post_params
    post.save!
    flash[:success] = "Post created!"

    # Josh's cool stuff
    # @current_user.post.create post_params
    
    redirect_to root_path
  end

  def show
    @post = Post.find params[:id]
  end

  private

  def post_params 
    return params.require(:post).permit(:title, :link, :user_id)
  end
end
