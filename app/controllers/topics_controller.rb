class TopicsController < ApplicationController
  def new 
    @forum = Forum.find(params[:forum_id])
    @topic = Topic.new
  end 

  def create 
    @forum = Forum.find(params[:forum_id])
    @topic = current_user.topics.create(topic_params)

    redirect_to [@forum, @topic]
  end

  def show
    @forum = Forum.find(params[:forum_id])
    @topic = Topic.find(params[:id])
  end

  private

  def topic_params
    params.require(:topic).permit(:name,
      post_attributes: [:id, :body]
    ).merge(forum_id: @forum.id)
  end
end
