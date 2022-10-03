# frozen_string_literal: true

class RemoveMessageFromValues < ActiveRecord::Migration[7.0]
  def change
    remove_index :values, :message_id
  end
end
