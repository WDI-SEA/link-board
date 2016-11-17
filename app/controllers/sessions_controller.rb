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

  def user_params
    params.require(:user).permit(:email, :password)
    # params
    # pulling out user data of params
    # only allowing email and password through
  end
end
