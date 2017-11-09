class TagsController < ApplicationController
  def index
  	@tags = Tag.all
  end

  def new
  	@tag = Tag.new
  	@posts = Post.all
  end

  def create
  	Tag.create(tag_params)
  	redirect_to root_path
  end

  def show
  	@tag = Tag.find(params[:id])
  end

  def tag_params
  	params.require(:tag).permit(:name, :post_ids => [])
  end
end
