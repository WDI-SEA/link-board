class UsersController < ApplicationController
  def new

  end

  def create
		user = User.create user_params
		if user.id
			session[:user_id] = user.id
			flash[:success] = "You are logged in"
			redirect_to root_path
		else
			flash[:danger] = "Your creds are not valid"
			redirect_to login_path	
		end

	end

  private

  def user_params
  	params.require(:user).permit(:email, :password, :name)
  end

end
