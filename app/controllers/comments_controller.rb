class CommentsController < ApplicationController
  def new
  end

  def create
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.create(params[:comment].permit(:name, :body, :date))
  	redirect_to  post_path(@post)
  end


  def destroy
  end
end
