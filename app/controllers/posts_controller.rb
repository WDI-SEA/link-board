class PostsController < ApplicationController
  def index
    # includes cuts down on querires to display each post
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
      # render json: @post.errors.messages
      flash[:danger] = 'Your post title was too long or your URL was invalid'
      redirect_to posts_new_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :link, :user_id) 
  end
end
