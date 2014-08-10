class ForumsController < ApplicationController
  def index
    @forums = Forum.all.page params[:page]
  end

  def new
    @forum = Forum.new
  end

  def create
    @forum = current_user.forums.create(forum_params)
    redirect_to @forum
  end

  def show
    @forum = Forum.find(params[:id])
    @topics = @forum.topics.page(params[:page])
  end

  private

  def forum_params
    params.require(:forum).permit(:name, :description)
  end
end
