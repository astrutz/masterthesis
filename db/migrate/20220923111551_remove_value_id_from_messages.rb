class RemoveValueIdFromMessages < ActiveRecord::Migration[7.0]
  def change
    remove_column :messages, :value_id, :integer
  end
end
