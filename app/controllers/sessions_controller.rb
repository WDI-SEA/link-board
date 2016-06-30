class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate user_params[:email], user_params[:password]
    if @user
      session[:user_id] = @user.id
      flash[:success] = "User Logged in"
      redirect_to root_path
    else
      flash[:danger] = "Credentials are invalid"
      redirect_to login_path
    end
  end
  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
