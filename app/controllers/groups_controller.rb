class GroupsController < ApplicationController

  def show
    @group = Group.find(params[:id])
    #need to edit so that it only shows posts of the group
    @posts = Post.most_recent
    # @posts = Post.where(:group_id => @group.id)
    #need to edit so that it only shows group of the current user
    @groups = Group.all
  end

  def new
    if !user_signed_in?
      redirect_to user_session_path
    end
    @users = User.all.sort_by { |user| user.username.upcase }
  end

  def create
    user = current_user
    group = Group.new(group_params)
    if group.save
      member_ids = params["users"]
      member_ids.each do |id|
        id.to_i
        group_user = GroupUser.new(user_id: id, group_id: group.id)
        group_user.save
      end
      redirect_to root_path
    else
      @errors = group.errors.full_messages
      render 'new'
    end
  end

  private
    def group_params
      params.require(:group).permit(:name, :params, group_users: [:user_id, :group_id])
    end
end