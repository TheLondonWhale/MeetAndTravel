class TipsController < ApplicationController
before_action :find_tip, only: [:show]
  def new

  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @tips = Tip.all

  end

  def create
  end

  def destroy
  end

  def update
  end

  def find_tip
   @tip = Tip.find(params[:id])
  end

end
