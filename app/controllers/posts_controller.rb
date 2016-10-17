class PostsController < ApplicationController
  def index
  	@posts = Post.most_recent
  end

  def new
  	require_user
  end

  def create
    user = current_user
    post = user.posts.new(post_params)
    if post.save
      redirect_to root_path
    else
      @errors = post.errors.full_messages
      render 'new'
    end
  end

  def edit
    require_user
    @post = Post.find(params[:id])
  end

  def update
    require_user
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to root_path
    else
      @errors = @post.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    require_user
    post = Post.find(params[:id])
    if logged_in? && current_user.id == post.user_id   
    post.destroy
    redirect_to posts_path
    end
  end

  private
    def post_params
      params.require(:post).permit(:body, :image)
    end
end
