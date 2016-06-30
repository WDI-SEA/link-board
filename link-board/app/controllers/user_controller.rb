class UserController < ApplicationController
  def new
  end

  def create
   User.create user_params
   redirect_to login_path #login is a route prefix (check in terminal rake: routes)
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
end
