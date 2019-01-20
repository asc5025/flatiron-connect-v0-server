class MessagesChannel < ApplicationCable::Channel
  def subscribed
    # byebug
    @conversation = Conversation.find(params[:conversation])
    stream_for @conversation
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
