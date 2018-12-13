class AdminsController < ApplicationController

  before_action :check_admin

  def users
    @users = User.all
  end

  def tips
    @users = User.all
    @tips = Tip.all
  end

  private

  def check_admin
    if current_user.admin?
    else
      flash[:notice] = "Tu ne peux pas accéder à ces pages car tu n'es pas admin"
      redirect_to root_path
    end
  end
end
