class Admins::PostCommentController < ApplicationController
    def destroy
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    @post = Post.find_by(id: params[:post_id])
    redirect_to admins_posts_path
  end
end
