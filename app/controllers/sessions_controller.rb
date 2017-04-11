class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.authenticate(user_params)

    if user
      session[:user_id] = user.id
      flash[:success] = 'You logged in!'
      redirect_to root_path
    else
      flash[:danger] = 'Incorrect credentials!'
      redirect_to login_path
    end 
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Bye!'
    redirect_to root_path
  end

  private
  
  def user_params
    params.require(:user).permit(:email, :password_digest) 
  end
end
