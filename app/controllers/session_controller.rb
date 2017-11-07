class SessionController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(user_params)

    if user
      session[:user_id] = user.id
      flash[:success] = 'You done logged in'
      redirect_to root_path
    else
      flash[:danger] = 'Your creds are weak'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Get out of here, you filthy animal'
    @user = nil
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
