class PostsController < ApplicationController
  before_action :current_user

  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new :user => :current_user
  end

  def create
  	#@post = current_user.posts.build(params[:post])
  	Post.create(post_params)
  	redirect_to posts_path
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	p = Post.find(params[:id])
  	p.update(post_params)
  	redirect_to posts_path
  end

  def show
  	@post = Post.find(params[:id])
  end

  def destroy
  	Post.find(params[:id]).delete
  	redirect_to posts_path
  end

  def post_params 
  	params.require(:post).permit(:title, :link, :user)
  	
  end

end
