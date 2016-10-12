class PostsController < ApplicationController
  def index
  	@posts = Post.most_recent
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

  def edit
    # require_user
    @post = Post.find(params[:id])
  end

  def update
    # require_user
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to @post
    else
      @errors = @post.errors.full_messages
      render 'edit'
    end
  end

  private
    def post_params
      params.require(:post).permit(:body, :user_id, :image)
    end
end
