class GroupsController < ApplicationController

  def new
    if !user_signed_in?
      redirect_to user_session_path
    end
    @users = User.all.sort_by { |user| user.username.upcase }
  end

  def create
    user = current_user
    group = Group.new(group_params)
    binding.pry

    if group.save
      member_ids = params["users"]
      binding.pry

      member_ids.each do |id|
        id.to_i
        binding.pry
        group_user = GroupUser.new(user_id: id, group_id: group.id)
        binding.pry
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