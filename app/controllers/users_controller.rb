class UsersController < ApplicationController
  def new
  end

  def create
  	User.create user_params[:email], user_params[:name], user_params[:password]
  end

  private

  def user_params
	  params.require(:user).permit(:email, :name, :password)
	end
end
