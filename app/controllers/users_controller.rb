class UsersController < ApplicationController
  def index
    @all_posts ||= Post.all
  end

  def create
    user = User.create(user_params)
    if user.save
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        redirect_to user_new_path
      end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    puts "user_controller pointing to SHOW ROUTE"
    @user = User.find(params[:id])
  end

  def update
    puts "editing user"
      u = User.find(params[:id])
      u.update(user_params)
      redirect_to user_path
  end

  def destroy
    puts "user_controller to destroy account"
      u = User.find(params[:id])
      u.destroy
      redirect_to new_user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :post_id => [], :comment_id => [])
  end

end
