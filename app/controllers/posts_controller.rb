class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def new
  	# require_user
  end

  def show
  	@post = Post.find(params[:id])
  end
end
