class PostsController < ApplicationController
  before_action :is_authenticated?, only: [:new]

  def index
    @posts = Post.all
  end

  def new
  end

  def create
    new_post = User.find(session[:user_id]).post.create post_params
    if new_post.id != nil
      flash[:success] = "New post added."
    else
      flash[:danger] = "Invalid post details."
    end
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :link)
    end
end
