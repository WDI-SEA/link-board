class PostsController < ApplicationController
  before_action :is_authenticated, only: [:new, :create]
  before_action :current_user, only: [:index, :show]


  def index
  
  end

  def new
  	@post = Post.new
  end

  def create
  	@current_user.posts.create(post_params)
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id]) 
    @comment_new = Comment.new
    @comments = Comment.where(post_id: params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, :notice => "Your post has been deleted"
  end

  def vote
    value = params[:type] == "up" ? 1 : -1
    @post = Post.find(params[:id]) 
    @post.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thank you for voting"
  end

  private

  def post_params
  	params.require(:post).permit(:title, :link, :user)
  end

end
