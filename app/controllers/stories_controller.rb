class StoriesController < ApplicationController
  def index
    @stories = Story.all
    @response = Response.new
  end

  def new
    @story = Story.new
  end

  def create
    @story = current_user.stories.create(story_params)
    redirect_to @story
  end

  def show
    @story = Story.find(params[:id])
    @responses = @story.responses
  end

  def edit
    @story = current_user.stories.find(params[:id])
  end

  def update
    @story = current_user.stories.find(params[:id])
    @story.update(story_params)
    redirect_to @story
  end

  def destroy
    story = current_user.stories.find(params[:id])
    story.destroy
    redirect_to root_path
  end

  private

  def story_params
    params.require(:story).permit(
      :title,
      :body,
      :image,
      :tag_list,
    )
  end
end
