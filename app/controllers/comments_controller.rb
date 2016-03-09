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
  
# the following was copied from post controller to add voting functionality. could not get to work
  # def upvote
  #   post = Post.find(params[:post_id])
  #   unless post.votes.find_by_user_id(@current_user.id)
  #     vote = Vote.create(value: 1, user_id: @current_user.id)
  #     post.votes << vote
  #     flash[:success] = 'Voted!'
  #   else 
  #     flash[:warning] = 'You done already had hersez!'
  #   end
  #   redirect_to root_path
  # end

  # def downvote 
  #   post = Post.find(params[:post_id])
  #   unless post.votes.find_by_user_id(@current_user.id)
  #     vote = Vote.create(value: -1, user_id: @current_user.id)
  #     post.votes << vote
  #     flash[:success] = 'Downvoted!'
  #   else 
  #     flash[:warning] = 'You done already had hersez!'
  #   end
  #   redirect_to root_path
  # end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
