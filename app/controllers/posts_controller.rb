class PostsController < ApplicationController
  before_action :is_authenticated?, except: [:index]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create post_params do |p|
      p.user_id = @current_user.id
      p.save
    end
    if post.valid?
      flash[:success] = 'Post created'
      redirect_to root_path
    else
      messages = post.errors.map { |k, v| "#{k} #{v}" }
      flash[:danger] = messages.join(', ')
      redirect_to new_post_path
    end
  end

  def show
    @post = Post.find params[:id]
  end

  def upvote
    post = Post.find(params[:post_id])
    # unless post.votes.find_by_user_id(@current_user.id) #if !post.votes.find_by_user_id(@current_user.id)
    if post.votes.find_by_user_id(@current_user.id)
      vote = Vote.where(votable_id: post.id, user_id: @current_user.id, votable_type: 'Post').take
      if post.votes.find_by_user_id(@current_user.id).value == 1
        flash[:warning] = 'You already voted'
      else
        vote.update_attribute(:value, 1)
        flash[:success] = 'Updated!'
      end
    else
      vote = Vote.create(value: 1, user_id: @current_user.id)
      post.votes << vote
      flash[:success] = 'Voted!'
    end

    redirect_to root_path
  end

  def downvote
    post = Post.find(params[:post_id])
    # unless post.votes.find_by_user_id(@current_user.id) #if !post.votes.find_by_user_id(@current_user.id)
    if post.votes.find_by_user_id(@current_user.id)
      vote = Vote.where(votable_id: post.id, user_id: @current_user.id, votable_type: 'Post').take
      if post.votes.find_by_user_id(@current_user.id).value == -1
        flash[:warning] = 'You already voted'
      else
        vote.update_attribute(:value, -1)
        flash[:success] = 'Updated!'
      end
    else
      vote = Vote.create(value: -1, user_id: @current_user.id)
      post.votes << vote
      flash[:success] = 'Voted!'
    end

    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :link)
  end
end
