class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end
  
  def create
    @post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = @post.id
    comment.save
  end

  def destroy
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    @post = Post.find_by(id: params[:post_id])
    redirect_to admins_post_path(@post)
  end

private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
