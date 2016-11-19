class MainController < ApplicationController
  before_action :current_user
  def index
  	 @posts = Post.all.order("created_at DESC")
  end

  #   def destroy
  #   Post.find(params[:id]).delete
  #   redirect_to posts_path
  # end
  
  # private

  # def post_params
  # 	params.require(:post).permit(:title, :link, :user)
  # end

end
