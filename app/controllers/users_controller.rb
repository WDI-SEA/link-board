class UsersController < ApplicationController
  def new
  end

  def create
		user = User.create(user_params)
		redirect_to login_path
		# user = User.authenticate(user)
		# puts user._id
		# sessionsController.create
		# session[:user_id] = user._id
		# flash[:success] = "You are logged in"
		# redirect_to root_path
	end

  private

  def user_params
  	params.require(:user).permit(:email, :password, :name)
  end

end
