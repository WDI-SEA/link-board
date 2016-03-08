class PostsController < ApplicationController
  def new
  	@post = Post.new
  end

  def create
  	post = @current_user.posts.create(post_params)
  	flash[:success] = "Post Created!"
  	redirect_to posts_path
  end

  def show
  	@posts = Post.all
  end

  def upvote
  	post = Post.find(params[:post_id])
  	unless post.votes.find_by_user_id(@current_user.id)
  	vote = Vote.create(value: 1, user_id: @current_user.id)
  	post.votes << vote
  	flash[:success] = "Voted!"
  else
  	flash[:warning] = "You already voted!"
  end
  	redirect_to root_path
  end

  def downvote
  	post = Post.find(params[:post_id])
  	unless post.votes.find_by_user_id(@current_user.id)
  	vote = Vote.create(value: -1, user_id: @current_user.id)
  	post.votes << vote
  	flash[:success] = "Voted!"
  else
  	flash[:warning] = "You already voted!"
  end
  	redirect_to root_path
  end

  private

  def post_params
  	params.require(:post).permit(:title, :link)
  end
end
