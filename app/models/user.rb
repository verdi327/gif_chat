class User < ActiveRecord::Base
  has_secure_password

  has_many :participants
  has_many :conversations, through: :participants
  has_many :messages

  before_create :create_auth_token

  def active_conversations
    conversation_ids = Participant.where("user_id = ? AND deleted_at IS NULL", id).map(&:conversation_id)
    Conversation.where(id: conversation_ids)
  end

  def all_conversations
    conversations
  end

  private

  def create_auth_token
    self.auth_token = SecureRandom.hex
  end
end
