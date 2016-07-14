class UsersController < ApplicationController
  # now you can't see the show page (/profile) unless you are logged in.
  # checks for current user, checks to see if user is logged in (and if not, redirect to another page,
  # this only applies to the show (/profile) page
  # before_action :is_authenticated, only: [:show]   <-- not necessary because we don't have a show page


  def new
    @user = User.new
  end

  def create
    # render json: params

    user = User.create(user_params)
    # if we're able to save the user to the database... redirect to root path
    if user.save
      # what is this?
      session[:user_id] = user.id
      redirect_to root_path
    else
      # show an error message
      flash[:Uhoh] = user.errors.messages
      redirect_to signup_path
    end
  end

  private

  def user_params
    # require user model. we're just accepting the name, email, password, and password confirmation values
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
