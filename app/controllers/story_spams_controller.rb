class StorySpamsController < ApplicationController
  def create
    story = Story.find(params[:story_id])
    story.flag_as_spam
    redirect_to story
  end
end
