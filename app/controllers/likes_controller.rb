class LikesController < ApplicationController
  before_action :find_tip
  before_action :find_like, only: [:destroy]

  def create
    @tip.likes.create(user_id: current_user.id)
    redirect_to @tip
  end

  def destroy
    @like.destroy
    redirect_to @tip
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
