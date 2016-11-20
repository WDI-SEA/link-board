class PostsController < ApplicationController
  before_action :is_authenticated, only: [:new, :create, :create_comment]
  before_action :current_user, only: [:index]

  def index
    @posts = Post.all
    @comments = Comment.all
    @users = User.all
  end

  def new
    @post = Post.new
    @comment = Comment.new
  end

  def create
    @current_user.posts.create(post_params)
    redirect_to root_path
  end

  def create_comment
    @current_user.comments.create(comment_params)
    redirect_to comments_path
  end

  private

  def comment_params 
    params.require(:comment).permit(:content)
  end

  def post_params
    params.require(:post).permit(:title, :link)
  end
end
