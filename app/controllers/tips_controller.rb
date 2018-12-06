class TipsController < ApplicationController

  before_action :find_tip, only: [:show]

  def index
    @tip = Tip.all
    @tip = Tip.joins(:categories).search(params[:search])
  end

  def show
  end

  private

  def find_tip
   @tip  = Tip.find(params[:id])
  end

end
