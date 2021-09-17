class Admins::UsersController < ApplicationController

 def index
  @users = User.all
 end

 def destroy
  @users = User.find(params[:id])
    user.destroy
    redirect_to admins_users_path(id: current_admin)
 end

end
