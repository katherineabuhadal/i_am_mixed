class StoriesController < ApplicationController
  def index
    @stories = Story.all
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
    params.require(:story).permit(:title, :body, :image)
  end
end
