class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create
  	user = User.create(user_params)
  	flash[:success] = "User profile created successfully."
  	session[:user_id] = user.id
  	redirect_to profile_path
  end

  def destroy
  end

  def show
    @posts = Post.all
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
