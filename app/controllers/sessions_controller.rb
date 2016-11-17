class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.authenticate(user_params);
  	if user
  		session[:user_id] = user.id
  		flash[:success] = 'User logged in'
  		redirect_to root_path
  	else
  		flash[:danger] = "Credentials Invalid"
  		redirect_to login_path
  	end
  end

  def destroy
  	session[:user_id] = nil
  	flash[:success] = "User logged out"
  	redirect_to root_path
  end

  private

  #This line filters out all the stuff ruby is using for the requests and just give us what we need
  def user_params
  	params.require(:user).permit(:email, :password)
  end
end
