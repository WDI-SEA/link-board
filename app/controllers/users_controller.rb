class UsersController < ApplicationController
  def new
  end

  def create
  	user = User.create user_params

  	if user.id
  		session[:user_id] = user.id
  		flash[:success] = 'User Created!'
  	else
  		flash[:danger] = "User couldnt be created"
  		redirect_to "/signup"
  		return
  	end

  	redirect_to root_path
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password)
  end	
end
