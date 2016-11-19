class GroupsController < ApplicationController

  def index
  	@groups = Group.most_recent
  end

  def new
    if !user_signed_in?
      redirect_to user_session_path
    end
  end

  def create
    user = current_user
    group = user.groups.new(group_params)
    if group.save
      redirect_to root_path
    else
      @errors = group.errors.full_messages
      render 'new'
    end
  end

  private
    def post_params
      params.require(:group).permit(:name)
    end
end