class MessageSerializer < ActiveModel::Serializer
  attributes :id, :conversation_id, :content, :user_id
end
