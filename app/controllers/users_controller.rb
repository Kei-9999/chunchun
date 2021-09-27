class UsersController < ApplicationController
    before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(5).order(id: "DESC")
  end
  def index
    @users = User.all.page(params[:page]).per(10).order(id: "DESC")
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
  
  def search
      #binding.pry
      @users = User.search(params[:keyword])
      @keyword = params[:keyword]
      render "index"
  end
  
private
 def user_params
    params.require(:user).permit(:name, :introduction, :user_image)
 end
  
  
end