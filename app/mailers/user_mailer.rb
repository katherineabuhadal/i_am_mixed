class UserMailer < ActionMailer::Base
  default from: "welcome@iammixed.com"

  def confirmation_email(user)
    @user = user
    @token = @user.token
    mail(to: @user.email, subject: "Welcome to iammixed.com")
  end
end
