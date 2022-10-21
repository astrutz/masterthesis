# frozen_string_literal: true

class RenameProcessAtToProcessedAt < ActiveRecord::Migration[7.0]
  def change
    rename_column :messages, :process_at, :processed_at
  end
end
