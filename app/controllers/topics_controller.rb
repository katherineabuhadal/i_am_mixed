class TopicsController < ApplicationController
  before_action :ensure_user_can_delete_topic, only: [:destroy]

  def new
    @forum = find_forum
    @topic = Topic.new
    @topic.posts.new
  end

  def create
    @forum = find_forum
    @topic = current_user.topics.create(topic_params)

    redirect_to [@forum, @topic]
  end

  def show
    @forum = find_forum
    @topic = find_topic
    @topics = @topic.posts.page(params[:page])
  end

  def destroy
    find_forum.topics.find(params[:id]).destroy

    redirect_to :forums
  end

  private

  def topic_params
    params.require(:topic).permit(
      :name,
      posts_attributes: [:id, :topic_id, :body]
    ).deep_merge(forum_id: @forum.id, posts_attributes: { "0" => { user_id: current_user.id }})
  end

  def ensure_user_can_delete_topic
    unless current_user.has_permission?(find_topic)
      flash[:error] = "You cannot delete this topic!"
      redirect_to root_path
    end
  end

  def find_forum
    Forum.find(params[:forum_id])
  end

  def find_topic
    Topic.find(params[:id])
  end
end
