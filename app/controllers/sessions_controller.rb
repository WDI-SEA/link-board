class SessionsController < ApplicationController
  def new

  end

  def create
  	user = User.authenticate(user_params[:email],
  	user_params[:password])

  	if user
  		session[:user_id] = user.id
  		flash[:success] = 'You have been hacked in!'
  		redirect_to posts_path
  	else
  		flash[:danger] = 'Sorry something went wrong, your email/password do not match'
  		redirect_to login_path
  	end

  end

  def destroy
  	session[:user_id] = nil
  	flash[:success] = 'You have been logged out!'
  	redirect_to root_path
  end

  private

  def user_params
  	params.require(:user).permit(:email,:password)
  end

end
