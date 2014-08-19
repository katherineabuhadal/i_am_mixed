class EmailConfirmationsController < ApplicationController
  def new
    @token = params[:user][:token]
  end

  def create
    token = params[:user][:token]
    user = User.find_by(token: token)
    user.update_attribute(:confirmed, true)
    redirect_to root_path
  end
end
