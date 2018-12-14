class RegistrationsController < ApplicationController

  def show
    @user = User.find(params[:id])
    @tips = Tip.where(creator_id: params[:id])
  end
end
