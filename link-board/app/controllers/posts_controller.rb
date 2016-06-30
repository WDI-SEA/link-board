class PostsController < ApplicationController
  before_action :is_authenticated?, only: [:new]
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    Post.create post_params
    redirect_to posts_path
  end

  def show
    @post = Post.find params[:id]
    @comments = @post.comments
    @vote = Vote.find_by(votable_type: "Post")
    # @comments = Comment.find_by_post_id(@post.id)
    # @comment = Comment.find params[:id]
  end

  private
  def post_params
    params.require(:post).permit(:title, :link, :user_id, :comment_id)
  end

end




