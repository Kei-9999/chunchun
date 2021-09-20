class KawaiisController < ApplicationController

    def create
     @post = Post.find(params[:post_id])
     kawaii = current_user.kawaiis.new(post_id: @post.id)
     kawaii.save
    end
    
end
