class CommentsController < ApplicationController
  before_action :is_authenticated, only: [:new, :create]
  before_action :current_user, only: [:index]
  
  def new
    @comment = Comment.new
  end

  def create
    @current_user.comments.create(comment_params)
    redirect_to posts_path
  end

  def show
    @posts = Post.all
    @users = User.all
    @comments = Comment.all
  end

  def destroy
    Comment.find(params[:id]).delete
    redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
