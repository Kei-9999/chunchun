class PostsController < ApplicationController
    def index
        @posts = Post.all.page(params[:page]).per(10).order(id: "DESC")
        @user = current_user
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
       @new_comment = Comment.new
    end
    
  def update
    @post = Post.find(params[:id])

     if @post.update(post_params)
      flash[:notice] = 'Post was successfully updated.'
      redirect_to post_path(@post.id)
     else
      render action: :edit
     end
  end
  
  def edit
    @post = Post.find(params[:id])
    if @post.user != current_user
      redirect_to books_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
    
private
  def post_params
    params.require(:post).permit(:post_image, :post_detail)
  end

end
