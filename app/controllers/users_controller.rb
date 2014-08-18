class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  layout "landing"

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if (@user.valid? && password_confirmation)
      @user.create_profile
      UserMailer.welcome_email(@user).deliver
      sign_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end

  def password_confirmation
    params[:user][:password] == params[:user][:password_confirmation]
  end
end
