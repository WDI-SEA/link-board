class SessionsController < ApplicationController
  def new
  end

  def signup
  end

  def create
  	user = User.authenticate(user_params)

  	if user
  		session[:user_id] = user.id
  		flash[:success] = "You are logged in"
  		redirect_to root_path
  	else
  		flash[:danger] = "User creds invalid."
  		redirect_to root_path
  	end
  end

  def destroy
  	session[:user_id] = nil
  	flash[:success] = "User logged out"
  	redirect_to root_path
  end

  private

  def user_params
  	params.require(:user).permit(:email, :password)
  end
end
