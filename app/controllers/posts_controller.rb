class PostsController < ApplicationController
	before_action :current_user, :is_authenticated

  def index
  	@posts = Post.all
  end

  def create
  	Post.create(post_params)
  	redirect_to posts_path
  end

  def new
  	@post = Post.new
    @tags = Tag.all
  end

  def edit
  	@post = Post.find(params[:id])
    @tags = Tag.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def update
  	t = Post.find(params[:id])
  	t.update(post_params)
  	redirect_to posts_path
  end

  def destroy
  	Post.find(params[:id]).delete
  	redirect_to posts_path
  end

  private

  def post_params
  	params.require(:post).permit(:title, :link, :user_id, :tag_ids => [])
  end
end
