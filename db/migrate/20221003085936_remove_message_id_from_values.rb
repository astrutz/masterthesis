# frozen_string_literal: true

class RemoveMessageIdFromValues < ActiveRecord::Migration[7.0]
  def change
    remove_column :values, :message_id, :integer
  end
end
