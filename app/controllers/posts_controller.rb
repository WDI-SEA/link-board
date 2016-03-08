class PostsController < ApplicationController
  def new
  	@post = Post.new
  end

  def create
  	post = @current_user.posts.create(post_params)
  	flash[:success] = "Post Created!"
  	redirect_to posts_path
  end

  def show
  	@posts = Post.all
  end

  private

  def post_params
  	params.require(:post).permit(:title, :link)
  end
end
