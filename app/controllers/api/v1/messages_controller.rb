class Api::V1::MessagesController < ApplicationController
  before_action :find_conversation
  skip_before_action :authorized

  def index
    @messages = @conversation.messages
    # @message = @conversation.message.new
    render json: @messages
  end

  def create
    @message = @conversation.messages.new(message_params)

    if @message.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        MessageSerializer.new(@message)
      ).serializable_hash
      MessagesChannel.broadcast_to @conversation, serialized_data
      head :ok
      # render json: @message
    end
  end

  private

  def find_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:content, :sender_id, :recipient_id)
  end

end
