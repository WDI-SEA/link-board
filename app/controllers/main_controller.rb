class MainController < ApplicationController
  before_filter :is_authenticated?,
  	:except => :index

  def index
  end

  def login
  end

  def logout
  end

  def register
  end
end
