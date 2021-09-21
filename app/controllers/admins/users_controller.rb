class Admins::UsersController < ApplicationController

 def index
  @users = User.all
 end

 def show
  @posts = Post.all
  @user = User.find(params[:id])
 end

 def destroy
  user = User.find(params[:id])
  user.destroy
  redirect_to admins_users_path
 end

end
