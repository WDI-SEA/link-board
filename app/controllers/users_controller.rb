class UsersController < ApplicationController
  def new
  end

  def create
		user = User.create(user_params)
		# after_save {id = self.id}
		# user = User.authenticate(user)
		# puts user
		# session[:user_id] = user.id
		# flash[:success] = "You are logged in"
		redirect_to root_path
	end

  private

  def user_params
  	params.require(:user).permit(:email, :password, :name)
  end

end
