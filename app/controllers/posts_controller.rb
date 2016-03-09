class PostsController < ApplicationController
  before_action :is_authenticated?, except: [:index]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create post_params do |p|
      p.user_id = @current_user.id
      p.save
    end
    if post.valid?
      flash[:success] = 'Post created'
      redirect_to root_path
    else
      messages = post.errors.map { |k, v| "#{k} #{v}" }
      flash[:danger] = messages.join(', ')
      redirect_to new_post_path
    end
  end
# commented old code out. However bug isn't fixed. It's better. But not fixed.
  # def show
  #   @post = Post.find params[:id]
  # end

  # def upvote
  #   post = Post.find(params[:post_id])
  #   unless post.votes.find_by_user_id(@current_user.id)
  #     vote = Vote.create(value: 1, user_id: @current_user.id)
  #     post.votes << vote
  #     flash[:success] = 'Voted!'
  #   else 
  #     flash[:warning] = 'You done already had hersez!'
  #   end
  #   redirect_to root_path
  # end

  # def downvote 
  #   post = Post.find(params[:post_id])
  #   unless post.votes.find_by_user_id(@current_user.id)
  #     vote = Vote.create(value: -1, user_id: @current_user.id)
  #     post.votes << vote
  #     flash[:success] = 'Downvoted!'
  #   else 
  #     flash[:warning] = 'You done already had hersez!'
  #   end
  #   redirect_to root_path
  # end

  # private

  # def post_params
  #   params.require(:post).permit(:title, :link)
  # end

  def show
    @post = Post.find params[:id]
  end

  def upvote
    vote(:up)
    redirect_to root_path
  end

  def downvote
    vote(:down)
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :link)
  end

  def vote(direction)
    vote_value = direction == :up ? 1 : -1

    post = Post.find(params[:post_id])
    vote = post.votes.find_or_create_by(user_id: @current_user.id)
    vote.value = (vote.value) == vote_value ? 0 : vote_value
    vote.save!
  end
end
