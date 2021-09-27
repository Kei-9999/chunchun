class Admins::PostCommentController < ApplicationController
    def destroy
    @post = Post.find_by(id: params[:post_id])
    # binding.pry
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to admins_posts_path
    end
end
