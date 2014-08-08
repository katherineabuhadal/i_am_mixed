class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:user_id])
    @user = @profile.user
    @message = Message.new
  end

  def edit
    @profile = current_user.profile
  end

  def update
    profile = current_user.profile
    profile.update(profile_params)
    redirect_to profile
  end

  private

  def profile_params
    params.require(:profile).permit(
      :description,
      :avatar,
      :birthday,
      :tag_list,
    )
  end
end