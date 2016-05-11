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
    # redirect_to comments_path comment
    redirect_to :back
  end

  def new
      @comment = Comment.new
  end

  def edit
    @comment = Comment.find params[:id]
    session[:return_to] ||= request.referer
  end

  def show
    @comment = Comment.find params[:id]
    @posts = @comment.posts
  end

  def update
    t = Comment.find params[:id]
    t.update comment_params
    redirect_to session.delete(:return_to)
  end

  def destroy
    Comment.find(params[:id]).delete
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
