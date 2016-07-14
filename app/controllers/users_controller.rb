class UsersController < ApplicationController
  before_action :is_authenticated, only: [:show]

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to profile_path
    else
      flash[:danger] = user.errors.messages
      redirect_to signup_path
    end
  end

  def show
    # @post = Post.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
