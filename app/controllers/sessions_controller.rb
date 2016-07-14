class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(user_params)
    # once the user enters info to log in, if their info is valid then flash a success message,
    # set the session, and redirect to the home page
    if user
      flash[:success] = 'You have logged in'
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:danger] = 'Invalid username or password'
      redirect_to login_path
    end
  end

  def destroy
     # look at application controller
     # When a user logs out, we stop the session by assigning it to nil
    session[:user_id] = nil
    flash[:success] = 'You have logged out'
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end


end
