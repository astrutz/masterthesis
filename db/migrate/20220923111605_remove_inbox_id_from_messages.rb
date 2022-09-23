class RemoveInboxIdFromMessages < ActiveRecord::Migration[7.0]
  def change
    remove_column :messages, :inbox_id, :integer
  end
end
