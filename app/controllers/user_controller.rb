class UserController < ApplicationController


  def new
    @user = User.new
  end
  def create
    user = User.new user_params
    user.save!
    flash[:success] = "User created! Please log in!"
    
    redirect_to post_index_path
  end
  private
  def user_params 
    return params.require(:user).permit(:email, :password, :username)
  end
end