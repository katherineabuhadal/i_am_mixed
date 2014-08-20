class UserCreator
  def self.populate_info(user)
    user.create_profile
    user.generate_token
    UserMailer.confirmation_email(user).deliver
  end
end
