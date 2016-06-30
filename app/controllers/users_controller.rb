class UsersController < ApplicationController
	def new
  end

  def create
    user = User.create user_params
    if user.valid?
      session[:user_id] = user.id
      flash[:success] = 'User created and logged in'
      redirect_to root_path
    else
       flash[:danger] = "Something went wrong!"
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
