class MainController < ApplicationController
  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:title, :link)
  end
end
