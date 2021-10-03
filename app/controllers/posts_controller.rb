class PostsController < ApplicationController
    before_action :authenticate_user!
    def index
        @posts = Post.all.page(params[:page]).per(10).order(id: "DESC")
        @user = current_user
    end
    
    def new
        @post = Post.new
    end
    def create
      @post = Post.new(post_params)
      @post.score = Language.get_data(post_params[:post_detail])  #この行を追加
      @post.user_id = current_user.id
      flash[:notice] = 'Post was successfully created.'
     if @post.save
      redirect_to post_path(@post)
      tags = Vision.get_image_data(@post.post_image)    
      tags.each do |tag|
       @post.tags.create(tag_name: tag)
      end
     else
      render :new
     end
    end

    def show
       @post = Post.find(params[:id])
       @user = @post.user
       @new_comment = Comment.new
       @tags = Tag.where(id: PostTagRelation.where(post_id: @post.id).pluck(:tag_id))

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
      redirect_to posts_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user.id) 
  end
  
  def search
      @posts = Post.search(params[:keyword]).page(params[:page])
      @keyword = params[:keyword]
      render "index"
  end
    
private
  def post_params
    params.require(:post).permit(:post_image, :post_detail)
  end

end
