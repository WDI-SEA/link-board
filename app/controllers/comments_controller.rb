class CommentsController < ApplicationController
  def index
  end

  def new
  	@comment = Comment.new
  	@post = Post.find(params[:post])
  end

  def create
  	Comment.create(comment_params)
  	redirect_to root_path
  end

  def show
  end

  def comment_params
  	params.require(:comment).permit(:content, :post_id)
  end
end
