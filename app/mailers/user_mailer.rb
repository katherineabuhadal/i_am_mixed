class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    @token = @user.token
    @url = polymorphic_url([:new, :email_confirmation, @token])
    mail(to: @user.email, subject: "Welcome to iammixed.com")
  end
end
