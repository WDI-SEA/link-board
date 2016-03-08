class MainController < ApplicationController
	before_filter :is_authenticated?,
	:except => :index
  
  def index
  end
end
