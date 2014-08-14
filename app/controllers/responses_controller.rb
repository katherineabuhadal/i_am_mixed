class ResponsesController < ApplicationController
  def create
    @story = Story.find(params[:story_id]) || find_parent.story
    @response = current_user.responses.create(response_params)
    redirect_to @story
  end

  private

  def response_params
    params.require(:response).permit(:body).merge(story_id: @story.id)
  end

  # def find_parent
  #   parent = Response.find(params[:response_id])
  #   parent
  # end
end
