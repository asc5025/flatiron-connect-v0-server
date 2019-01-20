class Api::V1::ConversationsController < ApplicationController
 skip_before_action :authorized

  def index
    # byebug
    @conversations = Conversation.all
    # @conversations = Conversation.select do |convo|
    #   convo.messages.select do |m|
    #     m.sender.id == current_user.id || m.recipient.id == current_user.id
    #   end
    # end
    # @conversations = Conversation.where("sender_id = ? OR recipient_id = ?", current_user.id, current_user.id)
    # @users = User.where.not(id: current_user.id)
    render json: @conversations
  end

  def custom

    find_conversation

    @message = Message.new(message_params)

    @message.conversation_id = @conversation.id


    if @message.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        MessageSerializer.new(@message)
      ).serializable_hash
      MessagesChannel.broadcast_to @conversation, serialized_data
      head :ok
    end
    # render json: @message
  end

  def show
    @conversation = Conversation.find(params[:id])
    # @sender = User.find_by(id: @conversation.sender_id)
    # @recipient = User.find_by(id: @conversation.recipient_id)
    render json: @conversation
  end

  # def create
  #   if Conversation.between(params[:sender_id], params[:recipient_id]).present?
  #     @conversation = Conversation.between(params[:sender_id], params[:recipient_id])
  #     # @message = Message.create(message_params)
  #     render json: @conversation
  #   else
  #     @conversation = Conversation.create!(conversation_params)
  #     render json: { conversation: ConversationSerializer.new(@conversation) }, status: :created
  #   end
  # end

  private


  def find_conversation
    # if Conversation.between(params[:sender_id], params[:recipient_id]).present?
    # if Conversation.where(sender_id: params[:message][:sender_id], recipient_id: params[:message][:recipient_id]).present?
    if Conversation.between(params.require(:message)[:sender_id], params.require(:message)[:recipient_id]).present?
      @conversation = Conversation.between(params.require(:message)[:sender_id], params.require(:message)[:recipient_id])[0]
    else
      # @conversation = Conversation.create!(sender_id: params[:message][:sender_id], recipient_id: params[:message][:recipient_id])
      @conversation = Conversation.new(sender_id: params[:message][:sender_id], recipient_id: params[:message][:recipient_id])
        if @conversation.save
          serialized_data = ActiveModelSerializers::Adapter::Json.new(
            ConversationSerializer.new(@conversation)
          ).serializable_hash
          ActionCable.server.broadcast 'conversations_channel', serialized_data
          head :ok
        end
    end
  end

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end

  def message_params
    params.require(:message).permit(:content, :sender_id, :recipient_id)
  end

  # def message_params
  #   params.permit(:content, :user_id)
  # end

  # def find_conversation
  #
  # end

end
