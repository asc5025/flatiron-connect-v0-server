class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :sender_id, :recipient_id, :messages
  has_many :messages
end
