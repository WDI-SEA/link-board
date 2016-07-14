class PostsController < ApplicationController

  before_action :is_authenticated, only: [:new, :create]

  def index
    @posts = Post.all
    # render json: @posts
  end

  def new
    @posts = Post.new

  end

  def create
    # render json: params
    # Post.create(post_params)
    # User.where(id:current_user.id).post.create(post_params)
    @post = Post.new(post_params)
    # @post = current_user.posts.new(post_params)
    @post.user_id = current_user.id if current_user
    if @post.save
      flash[:success] = 'Content Posted'
      redirect_to root_path
    else
      render posts_new
    end
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:title, :link)
  end
end
