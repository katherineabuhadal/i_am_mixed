class ForumsController < ApplicationController
  before_action :ensure_admin, only: [:create, :update, :destroy]

  def index
    @forums = Forum.all.page params[:page]
  end

  def new
    @forum = Forum.new
  end

  def create
    @forum = current_user.forums.new(forum_params)
    if @forum.save
      redirect_to @forum
    else
      render :new
    end
  end

  def show
    @forum = find_forum
    @topics = @forum.topics.page(params[:page])
  end

  def edit
    @forum = find_forum
  end

  def update
    @forum = find_forum
    if @forum.update(forum_params)
      redirect_to find_forum
    else
      render :edit
    end
  end

  def destroy
    find_forum.destroy

    redirect_to :forums
  end

  private

  def forum_params
    params.require(:forum).permit(:name, :description)
  end

  def find_forum
    Forum.find(params[:id])
  end
end
