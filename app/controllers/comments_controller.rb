class CommentsController < ApplicationController
  def index
    @current_user ||= User.find_by_id(session[:user_id])
    @comments = Comment.where(user_id: @current_user.id)
  end

  def create #all new posts go to post_id of the current_user
    @current_user ||= User.find_by_id(session[:user_id])
    @post = Post.find_by(params[:post_id])
    @comment = @post.comments.create(comment_params)
    puts "XXXXXXXXcomment: ", @comment.comment
    puts "XXXXXXXXpost: ", @post.id
    puts "XXXXXXXXuser: ", @current_user.id
    # render :text => @comment.comment
    redirect_to post_path(@post.id)
  end

  def new
    @comment = Comment.new
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def edit
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def show
    @comment = Comment.find(params[:id])
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def update
    post = Post.find(params[:id])
    comment = Comment.find(params[:id])
    comment.update(comment_params)
    redirect_to post_path(post)
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def destroy
    puts "post_controller to destory comment in db"
    c = Comment.find(params[:id])
    c.destroy
    redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :user_id, :post_id)
    # params.permit(:user_id => [], :post_id => [])
  end

end
