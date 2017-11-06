class PostController < ApplicationController
    before_action :current_user

  def index
      @posts = Post.all
  end

  def new
      @post = Post.new
  end

  def create
      Post.create(post_params)
      redirect_to root_path
  end

  def post_params
      defaults = {user_id: current_user.id}
      params.require(:post).permit(:user_id, :title, :link).reverse_merge(defaults)
  end
end
