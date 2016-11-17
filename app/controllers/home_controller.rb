class HomeController < ApplicationController
	before_action :current_user
  def index
  	@posts = Post.all
  	@users = User.all
  end
end
