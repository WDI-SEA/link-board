class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = Comment.all
    @comments = Comment.where(:post_id => @post.id)
    @comment = Comment.new
  end

  def create
    if @current_user
      @c = Comment.new(comment_params)
      @c.save!
      redirect_to "/comments/" + comment_params[:post_id]
    else
      flash[:warning] = "You need to log in to post a comment"
      redirect_to login_path
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end

end
