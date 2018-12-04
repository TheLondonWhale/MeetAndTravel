class TipsController < ApplicationController

  before_action :find_tip, only: [:show]

  def index
    @tips = Tip.all
  end

  def show
  end

  private

  def find_tip
   @tip = Tip.find(params[:id])
  end

end
