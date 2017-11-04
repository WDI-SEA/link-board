class UserController < ApplicationController
  	def new
	
	  	end
	
	  	def create
			@user = User.create(user_params)
	  		redirect_to 
	  	end
	
  	def user_params
	  params.require(:user).permit(:name, :email, :password)
	end
end
