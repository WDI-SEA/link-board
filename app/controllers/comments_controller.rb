class CommentsController < ApplicationController
	before_action :is_authenticated?, except: [:index]
 	
 	def index
 		@post = Post.find params[:post_id]
 		@comments = Comment.group(:post_id).count
 		@comments_count = @comments[@post.id]
	end

	def new
		@post = Post.find params[:post_id]
		@comment = Comment.new
	end

	def create
		Comment.create comment_params do |c|
			c.user_id = @current_user.id
			c.post_id = params[:post_id]
			c.save 
		end
		redirect_to post_comments_path(params[:post_id])
	end

	def destroy
	end

	private

	def comment_params
		params.require(:comment).permit(:body)
	end	
end
