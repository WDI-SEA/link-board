class UsersController < ApplicationController
  def new
    
  end

  def create
    user = User.create user_params
   

    if user.id
      session[:user_id] = user.id
      flash[:success] = 'User logged in'
      redirect_to root_path
    else
      flash[:danger] = "Invalid credentials"
      redirect_to login_path
    end
  end

  # make creation in db
  private

  def user_params 
    params.require(:user).permit(:name, :email, :password)
  end
end
