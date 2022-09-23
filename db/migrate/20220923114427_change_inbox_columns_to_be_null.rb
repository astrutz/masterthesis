class ChangeInboxColumnsToBeNull < ActiveRecord::Migration[7.0]
  def change
    change_column :inboxes, :messages_id, :integer, :null => true
    change_column :inboxes, :rules_id, :integer, :null => true
  end
end
