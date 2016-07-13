class UsersController < ApplicationController

  before_action :is_authenticated, only: [:show]
  
  def new
    @user = User.new
  end

  def create
    # render json: params
    user = User.create(user_params)
    if user.save
      flash[:success] = ' Thanks for signing up'
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:danger] = user.errors.messages
      redirect_to new_user_path
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
