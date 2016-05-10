class UsersController < ApplicationController
  def new
  end

  def create
    @user =User.authenticate user_params[:email], user_params[:password], user_params[:name]
    if @user
      session[:user_id] = @user.id
      flash[:success] = "User logged in"
      redirect_to root_path
    else
      flash[:danger] = "Credentials invalid"
      redirect_to login_path
  end
end
