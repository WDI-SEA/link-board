class UserController < ApplicationController
  	def new
	
	  	end
	
	  	def create
			@user = User.create(user_params)
	  		redirect_to root_path
	  	end
	
  	def user_params
	  params.require(:user).permit(:name, :email, :password, :post_ids => [])
	end
end
