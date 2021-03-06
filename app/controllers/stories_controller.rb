class StoriesController < ApplicationController
  before_action :require_login, only: [:new, :edit, :create, :update, :destroy]

  def index
    @stories = Story.all.page(params[:page])
    @response = Response.new
  end

  def new
    @story = Story.new
  end

  def create
    @story = current_user.stories.new(story_params)
    if @story.save
      redirect_to @story
    else
      render :new
    end
  end

  def show
    @story = Story.find(params[:id])
    @response = Response.new
    @responses = @story.top_level_responses
    @child = Response.new
  end

  def edit
    @story = current_user.stories.find(params[:id])
  end

  def update
    @story = current_user.stories.find(params[:id])
    if @story.update(story_params)
      redirect_to @story
    else
      render :edit
    end
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
