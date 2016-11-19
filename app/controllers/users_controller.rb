class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create
  	user = User.create user_params
  	if user.id
  		session[:user_id] = user.id
  		flash[:success] = 'User Logged In'
  	else
  		flash[:danger] = "Invalid Credentials"
  	end
  	redirect_to root_path
  end

  private

  def user_params
  	params.require(:user).permit(:email, :password, :name)
  end
end
