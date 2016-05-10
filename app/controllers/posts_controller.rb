class PostsController < ApplicationController
  before_action :is_authenticated?, only: [:new]

  def index
    @posts = Post.all
  end

  def new
  end

  def create
    Post.create post_params
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :link)
    end
end
