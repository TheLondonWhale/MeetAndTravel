class HomeController < ApplicationController
  def index
    @users = User.all
  end


  def private
  end
end
