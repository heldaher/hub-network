class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def new
  	# require_user
  end

  def create
    user = current_user
    post = user.posts.new(post_params)
    if post.save
      redirect_to post_path(post.id)
    else
      @errors = post.errors.full_messages
      render 'new'
    end
  end

  def show
  	# binding.pry
  	@post = Post.find(params[:id])
  	@user = @post.user
  end

  private
    def post_params
      params.require(:post).permit(:title, :description, :user_id, :image)
    end
end
