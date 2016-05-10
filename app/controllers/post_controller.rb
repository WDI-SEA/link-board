class PostController < ApplicationController
  before_action :is_authenticated?, only: [:index, :new, :show]

  def index
    @posts = Post.all
  end

  def new
    @posts = Post.new
  end

  def create
    post = Post.create post_params
    puts post
    redirect_to root_path

  end

  def show
    @post = Post.find params[:id]
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :link)
  end
end
