class PostsController < ApplicationController
  before_action :is_authenticated, only: [:new, :create]
  before_action :current_user, only: [:index, :show]
  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
  	@current_user.posts.create(post_params)
  	redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id]) 
    @comment_new = Comment.new
    @comments = Comment.where(post_id: params[:id])
  end

  def createComment
    Comment.create(comment_params)
    redirect_back(fallback_location: posts_path)
  end

  def up_vote
    puts "!!!called upvote"
  end

  def down_vote
    puts "!!!called downvote"
  end

  private

  def post_params
    params.require(:post).permit(:title, :link)
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end

end
