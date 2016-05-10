class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate user_params[:email], user_params[:password], user_params[:name]
    flash[:success] = "User logged in!"

    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "User logged out!"
    
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
end
