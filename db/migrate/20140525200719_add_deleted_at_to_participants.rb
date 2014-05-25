class AddDeletedAtToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :deleted_at, :timestamp
  end
end
