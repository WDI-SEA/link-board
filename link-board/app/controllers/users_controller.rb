class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create new_user_params
    if @user
      session[:user_id] = @user.id
      flash[:success] = "logged in"
      redirect_to root_path
    else
      flash[:danger] = "invalid"
      redirect_to login_path
    end
  end

  private

  def new_user_params
    params.require(:user).permit(:email, :password, :name)
  end
end