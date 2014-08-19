class EmailConfirmationsController < ApplicationController
  def new
    token = token.find(params[:token])
    user = User.find_by(token: token)
  end

  def create
    current_user.update_attributes(confirmed: true)
  end
end
