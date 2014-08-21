class MessagesController < ApplicationController
  before_action :require_login

  def index
    @messages = current_user.received_messages
  end

  def create
    current_user.sent_messages.create(message_params)
    redirect_to [current_user, :profile]
  end

  def show
    @message = current_user.sent_messages.find(params[:id])
  end

  private

  def receiver
    User.find(params[:user_id])
  end

  def message_params
    params.require(:message).permit(:body).merge(receiver_id: receiver.id)
  end
end
