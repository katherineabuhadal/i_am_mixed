class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def confirmation_email(user)
    @user = user
    @token = @user.token
    @url = new_email_confirmation_url(:email_confirmation, user: { token: @token })
    mail(to: @user.email, subject: "Welcome to iammixed.com")
  end
end
