class PostsController < ApplicationController
  # before_action :is_authenticated?,
  #   :only => :new

  def new
    @post = Post.new
  end

  def create
    puts @current_user
    # post = @current_user.posts.create
    # flash[:success] = 'Post created'
    redirect_to root_path
  end

  def index
  end
end
