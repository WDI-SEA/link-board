class MainController < ApplicationController
  before_action :current_user
  # before_action is a hook, runs before everything else

  def index
  end

end

