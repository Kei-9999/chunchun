class PostsController < ApplicationController
    def index
        @posts = Post.all
    end
    
    def new
        @post = Post.new
    end
    def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id
      flash[:notice] = 'Post was successfully created.'
     if @post.save
      redirect_to post_path(@post)
     else
      render :new
     end
    end

    def show
       @post = Post.find(params[:id])
       @user = @post.user
       
        
    end
    
private
  def post_params
    params.require(:post).permit(:post_image, :post_detail)
  end

end
