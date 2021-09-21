class UsersController < ApplicationController
  def show
    @posts = Post.all
    @user = User.find(params[:id])
  end
  def index
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
    # if @user != current_user
    #   redirect_to user_path(current_user.id)
    # end
  end
  
  def update
    @user = User.find(params[:id])

     if @user.update(user_params)
      flash[:notice] = 'You have updated user successfully'
      redirect_to user_path(@user.id)
     else

      render action: :edit
     end
  end
  
  def check
      @user = User.find(current_user.id) 
  end
  
  def destroy
      @user = User.find(params[:id]) 
      @user.destroy
      flash[:notice] = 'ユーザーを削除しました。'
      redirect_to :root
  end
  
private
 def user_params
    params.require(:user).permit(:name, :introduction, :user_image)
 end
  
  
end