class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = Comment.all
    @comments = Comment.where(:post_id => @post.id)
    @comment = Comment.new
  end

  def create
    @c = Comment.new(comment_params)
    @c.save!
    # if @c.save
    #   flash[:success] = comment_params
      redirect_to "/comments/" + comment_params[:post_id]
    # else
    #   redirect_to root_path
    # end
    #also save to post?
    # user = @current_user
    # user.comments.create(comment_params)
    # user.save!
    # Comment.create(comment_params)
    # flash[:success] = "New comment created!"
    # flash[:success] = comment_params
    # redirect_to comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end

end
