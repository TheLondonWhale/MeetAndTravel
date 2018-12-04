class LikesController < ApplicationController
  before_action :find_tip
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @tip.likes.create(user_id: current_user.id)
      flash[:notice] = "Liked !"
    end
    redirect_to tip_path(@tip)
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to tip_path(@tip)
  end

  private

  def find_like
   @like = @tip.likes.find(params[:id])
  end

  def find_tip
   @tip = Tip.find(params[:tip_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, tip_id:
    params[:tip_id]).exists?
  end

end
