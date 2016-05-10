class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    user = User.new user_params
    user.save!
    flash[:success] = "User created!"
    
    redirect_to root_path
  end

  private

  def user_params 
    return params.require(:user).permit(:email, :password, :name)
  end
end
