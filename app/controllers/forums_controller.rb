class ForumsController < ApplicationController
  def index
    @forums = Forum.all
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
  end

  private

  def forum_params
    params.require(:forum).permit(:name, :description)
  end
end
