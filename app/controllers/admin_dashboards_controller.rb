class AdminDashboardsController < ApplicationController
  before_action :ensure_admin, only: [:show]

  def show
    @stories = Story.spam
    @topics = Topic.spam
    @posts = Post.spam
  end
end
