class LandingController < ApplicationController
	before_action :is_authenticated, only: [:index]
	before_action :current_user, only: [:index]
	
  def index
  	puts 'hello world'
  end
end
