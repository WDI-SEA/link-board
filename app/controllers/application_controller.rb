class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def is_authenticated
    unless current_user
      flash[:danger] = "DANGER WILL ROBINSON (creds invalid)"
      redirect_to login_path
    end
  end

  def all_posts
    @all_posts ||= Post.all
  end

  def current_post
    @current_post ||= Post.find_by_id(@post[:id])
  end

  def current_user
    puts "XXXXXXXXXXXXXXXXXXXX"
    @current_user ||= User.find_by_id(session[:user_id])
  end

end
