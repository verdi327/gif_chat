class Participant < ActiveRecord::Base
  belongs_to :user
  belongs_to :conversation

  def soft_delete
    update_attribute(:deleted_at, Time.now)
  end
end
