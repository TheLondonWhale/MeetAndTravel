class ApplicationController < ActionController::Base

  before_action :configure_devise_parameters, if: :devise_controller?
  before_action :unread_messages

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:firstname, :username, :email, :password, :password_confirmation, :avatar)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :firstname,
      :lastname, :description, :birthdate, :password, :password_confirmation, :current_password, :avatar)}
  end

  def unread_messages
    @n = 0
    @conversations = Conversation.all
    @conversations.each do |conversation|
      if current_user
        if conversation.recipient_id == current_user.id || conversation.sender_id == current_user.id
          conversation.messages.each do |msg|
            #binding.pry
            if msg.user_id != current_user.id && msg.read == false
              @n += 1
            end
          end
        end
      end
    end
  end

end
