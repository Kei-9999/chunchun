class SearchesController < ApplicationController
    def search
         @users = User.search(params[:keyword])
         @keyword = params[:keyword]
         render "index"
    end
    
    def index
    end
end
