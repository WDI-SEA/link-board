class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    # render json: params
    user = User.new user_params
    if user.save
      session[:user_id] = user.id 
      redirect_to root_path
    else
      flash[:danger] = user.errors.messages
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
