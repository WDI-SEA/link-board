class PostsController < ApplicationController
  before_action :is_authenticated, only: [:new, :create]
  before_action :current_user, only: [:index]
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

  end

  def createComment
    @current_user.posts.comments.create(comment_params)
    redirec_to post_show
  end

  private

  def post_params
  	params.require(:post).permit(:title, :link)
  end
end
