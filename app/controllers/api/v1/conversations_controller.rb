class Api::V1::ConversationsController < ApplicationController
 skip_before_action :authorized

#   def index
#     @users = User.all
#     @conversations = Conversation.all
#   end
#
#   def create
#     byebug
#     if Conversation.between(params[:sender_id],params[:recipient_id]).present?
#       @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
#     else
#       @conversation = Conversation.create!(conversation_params)
#     end
#   end
#
#   private
#
#   def conversation_params
#     params.permit(:sender_id, :recipient_id)
#   end
# end

  def index
    @conversations = Conversation.all
    # @conversations = Conversation.where("sender_id = ? OR recipient_id = ?", current_user.id, current_user.id)
    # @users = User.where.not(id: current_user.id)
    render json: @conversations
  end

  def create
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
  end

  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end

end
