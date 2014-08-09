class PostsController < ApplicationController
  def new
    @forum = Forum.find(params[:forum_id])
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def create
    @forum = Forum.find(params[:forum_id])
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.create(post_params)
    redirect_to [@forum, @topic]
  end

  private

  def post_params
    params.require(:post).permit(:body).merge(topic_id: @topic.id)
  end
end
