class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  layout "landing"

  def new
  end

  def create
    user = authenticate_session(session_params)

    if sign_in(user)
      redirect_to root_path
    else
      flash[:error] = "There was a problem with your login credentials, please make sure you have the correct username and password"
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end

