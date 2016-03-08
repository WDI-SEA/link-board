class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	user = User.new(user_params)
  	flash[:success] = 'Hacker has been created!'
  	session[:user_id] = user.id
  	redirect_to profile_path
  end

  def show
  end

  def destroy
  end


  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
