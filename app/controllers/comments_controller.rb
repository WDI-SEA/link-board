class CommentsController < ApplicationController
  def index
      @comments = Comment.all
      @comment = Comment.new
  end

  def create
    comment = Comment.create comment_params do |c|
      c.user_id = @current_user.id
      c.save
    end
    redirect_to comments_path comment
  end

  def new
      @comment = Comment.new
  end

  def edit
    @comment = Comment.find params[:id]
  end

  def show
    @comment = Comment.find params[:id]
    @posts = @comment.posts
  end

  def update
    t = Comment.find params[:id]
    t.update comment_params
    redirect_to comments_path
  end

  def destroy
    Comment.find(params[:id]).delete
    redirect_to comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
