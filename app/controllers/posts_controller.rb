class PostsController < ApplicationController

  before_action :is_authenticated, only: [:new]

  def index
    @posts = Post.all
  end

  def new
    @posts = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = 'Content Successfully Created'
      redirect_to root_path
    else
      flash[:danger] = 'Content Not Saved'
      redirect_to root_path
    end

    # Post.create(post_params)
    # redirect_to root_path
    # render json: params
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:title, :link, :user_id)
  end
end
