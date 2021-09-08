class Users::UsersController < ApplicationController
  def top
    @post = Post.all
    
  end
  def index
    @users = User.all
     
  end
end
