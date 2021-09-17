class Admin::PostsController < ApplicationController
    
    def index
        @posts = Post.all
    end
    
    def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_to admins_posts_path
    end
end
