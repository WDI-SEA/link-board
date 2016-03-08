class PostController < ApplicationController
  # before_filter :is_authenticated?,
  #   :except => :index

  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @current_user.post.create(post_params)
    flash[:success] = "Post created"
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :link)
  end

end
