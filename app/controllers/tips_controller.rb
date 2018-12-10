require 'pry'
class TipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tip, only: [:show, :edit, :update, :destroy]


  def new
    @tip = Tip.new
  end

  def show
  end

  def index
    @tip = Tip.all
  end

  def create
    @tip = Tip.new(tip_params)
    if params[:tip][:pictures] != nil
      @tip.pictures.attach(params[:tip][:pictures])
    end
    respond_to do |format|
      if @tip.save
        format.html { redirect_to @tip, notice: 'Tip was successfully created.' }
        format.json { render :show, status: :created, location: @tip }
      else
        format.html { render :new }
        format.json { render json: @tip.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
  end

  def update
    @tip.update(tip_params)
    redirect_to tip_path(@tip.id)
  end


  private

  def tip_params
    params.require(:tip).permit(:category_ids, :id, :title, :description, :pictures, :site,:name,category_ids:[]).merge(creator_id: current_user.id)
  end

  def set_tip
    @tip = Tip.find(params[:id])
  end

end
