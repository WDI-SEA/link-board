class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(user_params[:email], user_params[:password])
    if user
      session[:user_id] = user.id
      flash[:success] = 'You have logged in! Hooray!'
      redirect_to secret_path
    else
      flash[:danger] = 'Come on now, try harder'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'logged out. good job'
    redirect_to root_path
  end

  private

   def user_params
    params.require(:user).permit(:email, :password)
   end 
end
