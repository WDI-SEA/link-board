class CommentsController < ApplicationController
before_action :is_authenticated?, except: [:index]

  def index
    @post = Post.find params[:post_id]
  end

  def new
    @post = Post.find params[:post_id]
    @comment = Comment.new
  end

  def upvote
    comment = Comment.find(params[:post_id])
    unless post.votes.find_by_user_id(@current_user)
      vote = Vote.create(value: 1, user_id: @current_user.id)
      comment.votes << vote
      flash[:success] = 'You voted! You matter!'
    else
      flash[:warning] = 'You already voted, dummy! SHOES!'
    end

    redirect_to root_path
  end

  def downvote
    comment = Comment.find(params[:post_id])
    unless comment.votes.find_by_user_id(@current_user)
      vote = Vote.create(value: -1, user_id: @current_user.id)
      comment.votes << vote
      flash[:success] = 'You voted! You matter!'
    else
      flash[:warning] = 'You already voted, dummy! SHOES!'
      redirect_to root_path
    end
  end

  def create
    Comment.create comment_params do |c|
      c.post_id = params[:post_id]
      c.user_id = @current_user.id
      c.save
    end
    redirect_to post_comments_path(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
