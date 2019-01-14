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
    # @message.user = current_user
    if @message.save
      render json: { message: MessageSerializer.new(@message) }, status: :created
    end
  end

  private

  def find_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:content, :user_id)
  end

end
