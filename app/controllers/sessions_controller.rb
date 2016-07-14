class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(user_params)
    if user
      flash[:success] = "You have logged in"
      session[:ser_id] = user.id
      redirect_to root_path
    else
      flash[:danger] = "Incorrect email and/or password"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
