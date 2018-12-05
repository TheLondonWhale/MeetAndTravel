class ApplicationController < ActionController::Base

  before_action :configure_devise_parameters, if: :devise_controller?

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:firstname, :username, :email, :password, :password_confirmation, :image)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :firstname,
      :lastname, :description, :birthdate, :password, :password_confirmation, :current_password, :image)}
  end

end
