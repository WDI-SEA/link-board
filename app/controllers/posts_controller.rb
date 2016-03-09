class PostsController < ApplicationController
	before_action :is_authenticated?, except: [:index]

	def index
		@posts = Post.all
		@comments = Comment.group(:post_id).count
		# @comments_count = @comments[@post_id]
	end	

	def new
		@post = Post.new
	end

	def create
		Post.create post_params do |u|
			u.user_id = @current_user.id
			u.save
		end
		redirect_to root_path

		if Post.create post_params.error
			flash[:danger] = "Invalid url."
			redirect_to profile_path
		end

	end

	def show
		@post = Post.find params[:id]
	end

	def upvote
		post = Post.find params[:post_id]

		unless post.votes.find_by_user_id(@current_user.id)
			vote = Vote.create(value: 1, user_id: @current_user.id)
			post.votes << vote
			post.save
			flash[:success] = "Voted!"
		else
			flash[:warning] = "You already voted!"
		end

		redirect_to root_path
	end

	def downvote
		post = Post.find params[:post_id]
		vote = Vote.create(value: -1, user_id: @current_user.id)
		post.votes << vote
		post.save
		
		redirect_to root_path
	end

	private

	def post_params
  		params.require(:post).permit(:title, :link)
 	end
end
