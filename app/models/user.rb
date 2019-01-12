class User < ApplicationRecord
  has_many :conversations, foreign_key: :sender_id
  has_many :messages

  validates :email, uniqueness: { case_sensitive: false }

  has_secure_password
end
