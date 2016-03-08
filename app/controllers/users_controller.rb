class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create
  	user = User.create(user_params)
  	flash[:success] = "User profile created successfully. Please log in."
  	session[:user_id] = user.id
  	redirect_to profile_path
  end

  def destroy
  end

  def show
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
