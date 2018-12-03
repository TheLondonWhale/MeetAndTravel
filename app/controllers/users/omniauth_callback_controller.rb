class User:OmniauthCallbackController < Devise::OmniauthCallbackController

  def facebook
    puts "==========="
    puts request.env['omniauth.auth'].inspect
    puts "==========="
  end


end
