class PostSpamsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    post.flag_as_spam
    redirect_to :forums
  end
end
