class User < ActiveRecord::Base
  has_secure_password

  has_many :participants
  has_many :conversations, through: :participants
  has_many :messages

  before_create :create_auth_token

  private

  def create_auth_token
    self.auth_token = SecureRandom.hex
  end
end
