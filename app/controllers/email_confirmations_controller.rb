class EmailConfirmationsController < ApplicationController
  def new
    @token = token
  end

  def create
    user = User.find_by!(token: token)
    user.update_attribute(:confirmed, true)
    redirect_to root_path
  end

  private

  def token
    params[:user][:token]
  end
end
