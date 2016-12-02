class HomeController < ApplicationController
	before_action :is_authenticated, only: [:create, :create_comment]
	before_action :current_user, only: [:index, :add_vote]

    def index
  	  @posts = Post.all.reverse
  	  @users = User.all
  	  if @current_user
  	  	@votes  = @current_user.votes
  	  end
  	  @comments = Comment.all
  	  @post = Post.new
  	  @comment = Comment.new
  	  @vote = Vote.new
  	
    end

	def create
		@current_user.posts.create(post_params)
		redirect_to "/home"
	end

	def create_comment
		puts comment_params.inspect
		@current_user.comments.create(comment_params)
		render :action => 'index'
 	end

	def add_vote
        @vote = Vote.new(vote_params)
        @vote.save
        post = Post.find(vote_params[:post_id])
        if vote_params['choice'] == 'up'
			post.upvotes = post.upvotes + 1
		else
			post.downvotes = post.downvotes + 1
		end
		post.save
		@posts = Post.all.reverse
        puts params.inspect
        render :action => 'index'
    end

	def destroy
   		Post.find(params[:id]).delete
   		redirect_to "/home"
 	end

	private

	def vote_params
		params.permit(:choice, :post_id, :user_id)
	end
	def comment_params
		params.require(:comment).permit(:content, :post_id)
	end

	def post_params
		params.require(:post).permit(:title, :link)
	end

end
