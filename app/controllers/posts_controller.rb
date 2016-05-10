class PostsController < ApplicationController
  def index
    @links =Link.all { |e|  }
  end

  def create
    Link.create link_params
    redirect_to links_path 
    # tweets_path is basically saying take me to /tweets
  end

  def new
    @link = Link.new
    # This will create a new tweet object 
  end

  def edit
  end

  def show
    @link = Link.find params[:id]
  end

  def update
  end

  def destroy
  end

  private
  def link_params
    params.require(:link).permit(:title, :link)
  end
end