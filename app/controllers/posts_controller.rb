class PostsController < ApplicationController
before_action :is_authenticated?, only: [:new]
  
  def index
    @posts = Post.all
  end


  def new
    @post = Post.new
  end

  def create
      post = Post.create post_params do |p|
        puts p
      p.user_id = @current_user.id
      p.save
      redirect_to root_path
    end
  end

   private
  def post_params
    params.require(:post).permit(:title, :link)
  end
end
