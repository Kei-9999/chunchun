class HomesController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def top
    # @user = User.find(params[:id])
  end
  def about
  end
end
