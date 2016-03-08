class PostsController < ApplicationController

	def index
		@posts = Post.all
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

	# def create
	# 	p = Post.new
	# 	postObj = params['post']
	# 	p.title = postObj['title']
	# 	p.link = postObj['link']
	# 	p.save
	# end

	def show
		@post = Post.find params[:id]
	end

	def upvote
		post = Post.find params[:post_id]
		vote = Vote.create(value: 1, user_id: @current_user.id)
		post.votes << vote
		post.save

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
