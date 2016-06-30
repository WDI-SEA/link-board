class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    post = Post.create post_params do |p|
      p.user_id = @current_user.id
      p.save
    end
    redirect_to posts_path
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find params[:id]
  end

  def show
    @post = Post.find params[:id]
    @comments = Comment.all
  end

  def update
    p = Post.find params[:id]
    p.update post_params
    redirect_to posts_path
  end

  def destroy
    Post.find(params[:id]).delete
    redirect_to posts_path
  end

  def upvote
    @votes = Vote.all
    post = Post.find(params[:post_id])
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

