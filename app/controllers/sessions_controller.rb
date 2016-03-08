class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.authenticate(user_params[:email], 
        user_params[:password])
    if user
        #login
        session[:user_id] = user.id
        flash[:success] = 'you have logged in! Hooray!'
        redirect_to root_path
    else
        #FAIL
        flash[:danger] = 'NOPE'
        redirect_to login_path
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = 'Logged out, congrats.'
    redirect_to root_path
  end

  private
  
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
