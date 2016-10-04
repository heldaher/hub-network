class UsersController < ApplicationController
  def new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
    binding.pry
  	user = User.new(user_params)
  	if user.save
  	  session[:user_id] = user.id
      redirect_to posts_path
  	else
  	  @errors = user.errors.full_messages
  	  render 'new'
  	end
  end

private
   def user_params
	 params.require(:user).permit(:username, :email, :password)
   end
end
