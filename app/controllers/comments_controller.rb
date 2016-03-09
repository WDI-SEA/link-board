class CommentsController < ApplicationController
  before_action :is_authenticated?, except: [:index]

  def index
    @post = Post.find params[:post_id]
  end

  def new
    @post = Post.find params[:post_id]
    @comment = Comment.new
  end

  def create
    Comment.create comment_params do |c|
      c.post_id = params[:post_id]
      c.user_id = @current_user.id
      c.save
    end
    redirect_to post_comments_path(params[:post_id])
  end

  def upvote
    comment = Comment.find(params[:post_id])
    # unless post.votes.find_by_user_id(@current_user.id) #if !post.votes.find_by_user_id(@current_user.id)
    if comment.votes.find_by_user_id(@current_user.id)
      vote = Vote.where(votable_id: comment.id, user_id: @current_user.id, votable_type: 'Comment').take
      if comment.votes.find_by_user_id(@current_user.id).value == 1
        flash[:warning] = 'You already voted'
      else
        vote.update_attribute(:value, 1)
        flash[:success] = 'Updated!'
      end
    else
      vote = Vote.create(value: 1, user_id: @current_user.id)
      comment.votes << vote
      flash[:success] = 'Voted!'
    end

    redirect_to root_path
  end

  def downvote
    comment = Comment.find(params[:post_id])
    # unless post.votes.find_by_user_id(@current_user.id) #if !post.votes.find_by_user_id(@current_user.id)
    if comment.votes.find_by_user_id(@current_user.id)
      vote = Vote.where(votable_id: comment.id, user_id: @current_user.id, votable_type: 'Comment').take
      if comment.votes.find_by_user_id(@current_user.id).value == -1
        flash[:warning] = 'You already voted'
      else
        vote.update_attribute(:value, -1)
        flash[:success] = 'Updated!'
      end
    else
      vote = Vote.create(value: -1, user_id: @current_user.id)
      comment.votes << vote
      flash[:success] = 'Voted!'
    end

    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
