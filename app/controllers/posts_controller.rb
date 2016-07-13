class PostsController < ApplicationController
  def index
    @posts = Post.all.includes(:user)
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      session[:post_id] = @post.id
      redirect_to root_path
    else
      # this render function may not be necessary
      render json: @post.errors.messages
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :link, :user_id) 
  end
end
