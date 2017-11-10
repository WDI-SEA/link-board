class PostsController < ApplicationController
  def index
    @current_user ||= User.find_by_id(session[:user_id])
    @posts = @current_user.posts
  end

  def create
    user = @current_user ||= User.find_by_id(session[:user_id])
    post = Post.create(post_params.merge(user_id: user.id))
    puts post.title
    redirect_to post_path(post)
  end

  def new
    @post = Post.new
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def edit
    @post = Post.find(params[:id])
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def show
    puts "pet_controller pointing to SHOW ROUTE"
    @post = Post.find(params[:id])
    @current_user ||= User.find_by_id(session[:user_id])
    @comments = Comment.where(post_id: @post.id)
    @comment = Comment.where(user_id: @current_user.id)
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post)
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def destroy
    puts "post_controller to destory post in db"
    p = Post.find(params[:id])
    p.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id, :comment_id)
  end

end
