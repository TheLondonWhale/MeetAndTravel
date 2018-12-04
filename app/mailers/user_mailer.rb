class UserMailer < ApplicationMailer
  def welcome_email()
     mail(from: "thehackingproject.lille@outlook.fr", to: "@user.email",
          subject: "This is a nice welcome email")
   end
end
