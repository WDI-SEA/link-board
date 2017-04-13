class CommentsController < ApplicationController

  def create 
    c = Comment.create(comment_params)
    redirect_to "/post/" + c.post.id.to_s
  end

  private 

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
