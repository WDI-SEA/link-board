class PostsController < ApplicationController
  before_action :is_authenticated?, only: [:restricted]

  def index
    # @links =Link.all { |e|  }
  end

  def new
    @post = Post.new
    # This will create a new tweet object \
  end


  def create
    # Link.create link_params
    # redirect_to links_path 
    post = Post.new post_params
    post.save!
    redirect_to posts_new_path
  end

  

  def edit
  end

  def show
    # @link = Link.find params[:id]
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :link)
  end
end