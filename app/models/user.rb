class User < ApplicationRecord
  # has_many :conversations
  # has_many :conversations, foreign_key: :sender_id
  # has_many :conversations, foreign_key: :recipient_id

  # attr_reader :conversations

  has_many :messages, foreign_key: :sender_id
  has_many :messages, foreign_key: :recipient_id

  validates :email, uniqueness: { case_sensitive: false }

  has_secure_password

  def conversations
    Conversation.where("(conversations.sender_id = ? OR conversations.recipient_id = ?)", self.id, self.id)
  end

end
