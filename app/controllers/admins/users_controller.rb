class Admins::UsersController < ApplicationController
 # before_action :authenticate_admin!

 def index
  @users = User.all.page(params[:page]).per(10).order(id: "DESC")
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
