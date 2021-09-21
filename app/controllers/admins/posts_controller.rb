class Admins::PostsController < ApplicationController
    
    def index
        @posts = Post.all
    end
    
    def show
        @post = Post.find(params[:id])
    end
    
    def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_to admins_posts_path
    end
end
