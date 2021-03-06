class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :sender, :foreign_key => :sender_id, class_name: "User"
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: "User"

  validates_presence_of :content, :conversation_id, :sender_id, :recipient_id

end
