class CommentsController < ApplicationController
  def create
    # @post = Post.find(params[:post_id])
    # @comment = @post.comment.create(comment_params)
    # OR
    # @comment = @post.comments.create(comment_params)
    # @comment.user_id = user.id
    @current_user ||= User.find_by_id(session[:user_id])
    #@comment = Comment.create(comment_params)
    @comment = Comment.create(comment_params.merge(user_id: @current_user.id))
    puts "XXXXXXXXXXXXXXXXXXX comment: ", @comment.comment
    puts "XXXXXXXXXXXXXXXXXXX user: ", @current_user.id
    render :text => @comment.comment
    #redirect_to posts_path
  end

  def new
    @comment = Comment.new
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comments).permit(:comment, :user_id => [])
  end

end
