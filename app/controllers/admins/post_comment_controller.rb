class Admins::PostCommentController < ApplicationController
    def destroy
    # @post = Post.find_by(id: params[:post_id])
    # binding.pry
    comment = Comment.find_by(id: params[:id])
    comment.destroy
    redirect_to admins_post_path(comment.post_id)
    end
end
