class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  layout "landing"

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid? && confirm_password?
      UserCreator.populate_info(@user)

      @user = User.new
      flash[:alert] = "Thank you for joining! Please check your email for a confirmation link"
      redirect_to root_path
    else
      flash[:error] = "Passwords do not match"
      render :new
    end
  end

  private

  def confirm_password?
    params[:user][:password] == params[:user][:password_confirmation]
  end

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
