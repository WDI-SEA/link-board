class CommentsController < ApplicationController
  before_action :is_authenticated, only: [:create]
  before_action :current_user, only: [:index]


  def index
    @comments = Comments.all
    @users = User.all
     @posts = Post.all
  end

  def new
     @comment = Comment.new
  end

  def create
     @current_user.comments.create(comment_params)
     redirect_to root_path
   end

   private

   # Don't allow other params besides the ones we actually want
   def comment_params
     params.require(:comment).permit(:content, :post_id)
   end
 end
