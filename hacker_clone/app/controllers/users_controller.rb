class UsersController < ApplicationController



  def create
    # render json: User.create(user_params)
    User.create(user_params)
    redirect_to login_path
  end

  def new
    @user = User.new
  end

  def show
    @user = @current_user
    @posts = Post.where(:user_id => @current_user.id)
  end

  def edit
    @user = @current_user
  end

  def update
    u = User.find(@current_user.id)
    u.update(user_params)
    redirect_to "/users/show"
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
end
