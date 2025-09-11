class HomeController < ApplicationController
  def index
    @user = User.order(:id)
  end
end
