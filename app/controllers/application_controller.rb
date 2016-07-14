class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before we access any page, we're goin to set the session to the current user
  before_action = :current_user

# this is like creating middleware. we can call it in another controller
  def is_authenticated?
    # can also be rewritten as 'if !current_user'
    unless current_user
      flash[:danger] = 'Please login'
      redirect_to login_path
    end
  end

  def current_user
    # only going to run right side of current user is falsey
    # refers to users controller:  session[:user_id] = user.id
    @current_user ||= User.find_by_id(session[:user_id])
  end
end
