class UsersController < ApplicationController
  def index
  end

  def show
  	@user = @current_user
  end

  def edit
  end

  def new
  	@user = User.new
  end

  def create
  	User.create(user_params)
  	redirect_to login_path
  end

  private

  def user_params
  	params.require(:user).permit(:email, :password, :name)
  end
 
end
