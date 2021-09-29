class SearchesController < ApplicationController
    def search
      @users = User.search(params[:keyword]).page(params[:page])
      @keyword = params[:keyword]

      render "index"
    end
    
    def index
      @users = User.all
    end
end
