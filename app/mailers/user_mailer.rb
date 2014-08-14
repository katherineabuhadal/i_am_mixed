class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    @url = polymorphic_url(:sign_in)
    mail(to: @user.email, subject: "Welcome to iammixed.com")
  end
end
