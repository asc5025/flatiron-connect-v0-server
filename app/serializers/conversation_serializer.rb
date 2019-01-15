class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :sender_id, :recipient_id, :messages
  has_many :messages
  # belongs_to :user
  belongs_to :sender, :foreign_key => :sender_id, class_name: "User"
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: "User"
end
