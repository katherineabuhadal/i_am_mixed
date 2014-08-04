class LikesController < ApplicationController
  def create
    @story = Story.find(params[:story_id])
    current_user.like(@story)
    redirect_to :stories
  end

  def destroy
    @story = Story.find(params[:story_id])
    current_user.unlike(@story)
    redirect_to :stories
  end
end
