class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.authenticate(user_params[:email],
  		user_params[:password])

  	if user
  		session[:user_id] = user.id
  		flash[:success] = "We have logged in!"
  		redirect_to root_path
  	else
  		flash[:danger] = 'NOPE'
  		redirect_to login_path
  	end
  end

  def destroy
  	session[:user_id] = nil
		flash[:success] = 'Logged out. Good 4 U.'
		redirect_to root_path
  end

  private
  def user_params
  		params.require(:user).permit(:email, :password)
  end

end
