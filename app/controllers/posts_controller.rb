class PostsController < ApplicationController
before_filter :is_authenticated?,
  :except => :index
  
  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    
  end
end
