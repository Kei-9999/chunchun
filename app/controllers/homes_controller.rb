class HomesController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def top
  end
end
