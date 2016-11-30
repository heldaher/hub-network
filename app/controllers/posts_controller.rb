class PostsController < ApplicationController
  before_filter :authenticate_user!

  def index
  	@posts = Post.most_recent
    @groups = Group.all
  end

  def new
    if !user_signed_in?
      redirect_to user_session_path
    end
    @group = Group.find(params[:group])
  end

  def create
    user = current_user
    post = user.posts.new(post_params)
    post.group_id = params[:post][:group_id].to_i
    binding.pry
    if post.save
      redirect_to root_path
    else
      @errors = post.errors.full_messages
      render 'new'
    end
  end

  def edit
    if !user_signed_in?
      redirect_to user_session_path
    end
    @post = Post.find(params[:id])
  end

  def update
    if !user_signed_in?
      redirect_to user_session_path
    end
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to root_path
    else
      @errors = @post.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    if !user_signed_in?
      redirect_to user_session_path
    end
    post = Post.find(params[:id])
    if user_signed_in? && current_user.id == post.user_id   
      post.destroy
      redirect_to posts_path
    end
  end

  private
    def post_params
      params.require(:post).permit(:body, :image)
    end
end
