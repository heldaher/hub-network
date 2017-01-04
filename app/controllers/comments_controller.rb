class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def index
  	@comments = Comment.most_recent
    @groups = Group.all
  end

  def new
    if !user_signed_in?
      redirect_to user_session_path
    end
    binding.pry
  end

  def create
    user = current_user
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end