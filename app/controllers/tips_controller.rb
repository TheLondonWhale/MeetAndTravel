class TipsController < ApplicationController
before_action :find_tip, only: [:show]

  def new

  end

  def index
    @tip = Tip.all
    @tip = Tip.joins(:categories).search(params[:search])
    
  end

  def create
  end

  def destroy
  end

  def update
  end

  def find_tip
   @tip  = Tip.find(params[:id])
  end

end
