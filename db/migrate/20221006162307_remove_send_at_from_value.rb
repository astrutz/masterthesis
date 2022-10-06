# frozen_string_literal: true

class RemoveSendAtFromValue < ActiveRecord::Migration[7.0]
  def change
    remove_column :values, :send_at
  end
end
