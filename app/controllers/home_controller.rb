class HomeController < ApplicationController
	before_action :is_authenticated, only: [:create, :create_comment]
	before_action :current_user, only: [:index]
    def index
  	  @posts = Post.all
  	  @users = User.all
  	  @comments = Comment.all
  	  @post = Post.new
  	  @comment = Comment.new
    end

	def create
		@current_user.posts.create(post_params)
		redirect_to "/home"
	end

	def create_comment
		puts comment_params.inspect
		@current_user.comments.create(comment_params)
 	end

 	def add_vote
 		# @vote = Vote.new(params)
 		# @vote.save
 		Vote.create(params)
 		puts params.inspect
 		redirect_to "/home"
 	end

	def destroy
   		Post.find(params[:id]).delete
   		redirect_to root_path
 	end

	private

	def comment_params
		params.require(:comment).permit(:content, :post_id)
	end

	def post_params
		params.require(:post).permit(:title, :link)
	end

end
