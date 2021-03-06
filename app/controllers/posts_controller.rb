class PostsController < ApplicationController
  before_action :ensure_user_can_edit_post, only: [:edit, :update]
  before_action :require_login, only: [:new, :create, :destroy]

  def new
    @forum = find_forum
    @topic = find_topic
    @post = Post.new
  end

  def show
    @topic = find_topic
    @post = find_post
  end

  def create
    @forum = find_forum
    @topic = find_topic
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to [@forum, @topic]
    else
      render :new
    end
  end

  def edit
    @forum = find_forum
    @topic = find_topic
    @post = current_user.posts.find(params[:id])
  end

  def update
    @forum = find_forum
    @topic = find_topic
    @post = find_post
    if @post.update(post_params)
      redirect_to [@forum, @topic]
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:body).merge(topic_id: @topic.id)
  end

  def ensure_user_can_edit_post
    unless current_user.has_permission?(find_post)
      flash[:error] = "You cannot edit another user's post!"
      redirect_to root_path
    end
  end

  def find_forum
    Forum.find(params[:forum_id])
  end

  def find_topic
    Topic.find(params[:topic_id])
  end

  def find_post
    Post.find(params[:id])
  end
end
