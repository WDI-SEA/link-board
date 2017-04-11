class UserController < ApplicationController
  def index
    
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)

    if user
      session[:user_id] = user.id
      flash[:success] = 'You logged in!'
      redirect_to root_path
    else
      flash[:danger] = 'Incorrect credentials!'
      redirect_to login_path
    end 
  end

  def show
    @user = User.find(params[:id])
    @posts = Posts.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    u = User.find(params[:id])
    u.update(user_params)
    redirect_to '/'
  end

  private
  def user_params
    params.require(:user).permit(:email, :password_digest, :name)
  end
end
