class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate user_params[:email], user_params[:password]

    if @user
      session[:user_id] = @user.id
      session[:user_name] = @user.name
      flash[:success] = "#{session[:user_name]} logged in!"
      redirect_to root_path
    else
      flash[:danger] = "Invalid email or password."
      redirect_to login_path
    end    
  end

  def destroy
    flash[:success] = "#{session[:user_name]} logged out!!"
    session[:user_id] = nil
    session[:user_email] = nil
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end