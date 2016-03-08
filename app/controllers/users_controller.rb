class UsersController < ApplicationController
  before_filter :is_authenticated?,
    :only => :shows

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)

    puts "------------------"
    puts user_params
    puts "------------------"

    if user.name === nil
      # WHY DOES ^^^^^^^^^ WORK????????
      # ASK BRIAN || JOSH!!!!!
      flash[:success] = 'User created'
      session[:user_id] = :user_id
      redirect_to root_path
    else
      flash[:danger] = 'An error occured, try again'
      redirect_to login_path
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
