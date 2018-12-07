class TipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tip, only: [:show, :edit, :update, :destroy]

  require 'pry'
  def new
    @tip = Tip.new
  end

  def show
  end

  def index
    @tip = Tip.all
  end

  def create
    puts tip_params
    @tip = Tip.new(tip_params)
    @tip.pictures.attach(params[:tip][:pictures])
    binding.pry
    @tip.categories << (params[:tip][:category_ids])
    @tip.save
    redirect_to tip_path(@tip.id)
  end

  def destroy
  end

  def update
    @tip.update(tip_params)
    redirect_to tip_path(@tip.id)
  end


  private

  def tip_params
    params.require(:tip).permit(:category_ids, :id, :title, :description, :pictures, :site).merge(creator_id: current_user.id)
  end

  def set_tip
    @tip = Tip.find(params[:id])
  end

end
