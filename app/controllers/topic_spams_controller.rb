class TopicSpamsController < ApplicationController
  def create
    topic = Topic.find(params[:topic_id])
    topic.flag_as_spam
    redirect_to :forums
  end
end
