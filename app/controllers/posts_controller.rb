class PostsController < ApplicationController
  before_action :current_user, :is_authenticated
  
  # def show
  #    @post = Post.find(params[:id])
  # end

  def new
    @post = Post.new
    # puts "new route #{post_params}" 
  end

  def index
    @posts = Post.all
  end

  def create
    Post.create(post_params)
    redirect_to root_path
  end

  # def edit
  # end

  # def update
  # end

  # def delete
  # end

  # def destroy
  # end

  def post_params
    defaults = { user_id: current_user.id }
   params.require(:post).permit(:user_id, :title, :link).reverse_merge(defaults)
  end

end
