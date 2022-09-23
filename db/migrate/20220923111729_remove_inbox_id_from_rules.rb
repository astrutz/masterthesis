class RemoveInboxIdFromRules < ActiveRecord::Migration[7.0]
  def change
    remove_column :rules, :inbox_id, :integer
  end
end
