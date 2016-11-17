class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def is_autheticated
    unless current_user
      flash[:danger] = "Credentials Invalid"
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Tweet.new
  end

  def create
    Post.create(post_params)
    redirect_to "/"
  end

  def destroy
    Post.find(params[:id]).delete
    redirect_to "/"
  end

  private

  def post_params
    params.require(:post).permit(:title, :link, :user)

end
