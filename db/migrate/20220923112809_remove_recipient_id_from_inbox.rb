class RemoveRecipientIdFromInbox < ActiveRecord::Migration[7.0]
  def change
    remove_column :inboxes, :recipient_id, :integer
  end
end
