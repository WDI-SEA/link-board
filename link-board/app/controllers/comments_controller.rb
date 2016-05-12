class CommentsController < ApplicationController
  before_action :is_authenticated?
def create
  @comment = Comment.create comment_params
  redirect_to root_path
end

private
def comment_params
    params.require(:comment).permit(:comment_id, :content, :user_id, :post_id)
  end

end