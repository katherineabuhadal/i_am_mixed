class TopicsController < ApplicationController
  def new
    @forum = Forum.find(params[:forum_id])
    @topic = Topic.new
    @topic.posts.new
  end

  def create
    @forum = Forum.find(params[:forum_id])
    @topic = current_user.topics.create(topic_params)

    redirect_to [@forum, @topic]
  end

  def show
    @forum = Forum.find(params[:forum_id])
    @topic = Topic.find(params[:id])
    @topics = @topic.posts.page(params[:page])
  end

  private

  def topic_params
    params.require(:topic).permit(
      :name,
      posts_attributes: [:id, :topic_id, :body]
    ).deep_merge(forum_id: @forum.id, posts_attributes: { "0" => { user_id: current_user.id }})
  end
end
