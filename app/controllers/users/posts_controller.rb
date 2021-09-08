class Users::PostsController < ApplicationController
    def index
    end
    
    def new
        @post = Post.new
    end
    def create
      @post = Post.new(post_params)
     if @post.save
      redirect_to posts_show_path(@post)
     else
      render :new
     end
    end

    def show
       @post = Posts.find(params[:id])
       @user = @post.user
       
        
    end
    
private
  def post_params
    params.require(:post).permit(:post_image, :comment)
  end

end
