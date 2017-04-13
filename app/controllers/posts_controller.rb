class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    user = @current_user
    user.posts.create(post_params)
    user.save
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    p = Post.find(params[:id])
    post_params = {'title' => p.title, 'link' => p.link, 'user_id' => p.user.id, 'points' => p.points +=1}
    p.update(post_params)
    redirect_to '/'
  end

  def destroy
    Post.find(params[:id]).delete
    redirect_to '/'
  end

  private
  def post_params
    params.require(:post).permit(:title, :link, :user_id, :points)
  end
end
