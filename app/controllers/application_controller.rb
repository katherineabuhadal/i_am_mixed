class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def ensure_admin
    unless current_user.admin
      flash[:error] = "You must be an admin to do this"
      redirect_to root_path
    end
  end
end
