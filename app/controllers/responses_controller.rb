class ResponsesController < ApplicationController
  def create
    @story = find_story || find_parent.story
    @child = Response.new
    current_user.responses.create(response_params)
    redirect_to @story
  end

  def destroy
    response = Response.find(params[:id])
    response.destroy 
    redirect_to :stories
  end

  private

  def response_params
    params.require(:response).permit(:body).merge(story: @story, parent: find_parent)
  end

  def find_parent
    if params[:response_id]
      Response.find(params[:response_id])
    end
  end

  def find_story
    if params[:story_id]
      Story.find(params[:story_id])
    end
  end
end
