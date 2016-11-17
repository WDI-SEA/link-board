class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(user_params);

    if user
      session[:user_id] = user.id
      flash[:success] = 'User logged in'
      redirect_to new_post_path
    else
      flash[:danger] = 'Credentials invalid'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "User logged out"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
