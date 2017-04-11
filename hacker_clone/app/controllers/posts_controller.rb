class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create 
    render json: Post.create(post_params)
    # redirect_to "/"
  end

  def show
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  private 

  def post_params
    params.require(:post).permit(:title, :link, :user_id)
  end
end
