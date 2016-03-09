class PostsController < ApplicationController
  before_action :is_authenticated?, except: [:index]
  def new
    @post = Post.new
  end

  def create
    post = @current_user.posts.create(post_params)
    flash[:success] = 'New post created'
    redirect_to root_path
  end

  def index
    @posts = Post.all
  end

  def upvote
    post = Post.find(params[:post_id])
    unless post.votes.find_by_user_id(@current_user.id)
      vote = Vote.create(value: 1, user_id: @current_user.id)
      post.votes << vote
      flash[:success] = 'Voted'
    else
      flash[:warning] = 'You already voted'
    end
    redirect_to root_path
  end

  def downvote
    post = Post.find(params[:post_id])
    vote = Vote.create(value: -1, user_id: @current_user.id)
    post.votes << vote
    
    redirect_to root_path

  end

  private
  def post_params
    params.require(:post).permit(:title, :link)
  end
end
