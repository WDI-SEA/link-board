class CommentController < ApplicationController

	def index
		# @post = Post.find(params[post.id])
	end
	
	

	def new
		@comment = Comment.new
		@post = Post.find(params[:post]).id
		@user = current_user.id
	end

	def create
		@comment = Comment.create(comment_params)
		redirect_to root_path
	end
	
	def edit
	end
	
	def show
	end

	def update
	end

	def destroy
	end

	def comment_params 
		params.require(:comment).permit(:title, :text,:user_id, :post_id)
	end

end
