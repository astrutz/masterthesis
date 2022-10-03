# frozen_string_literal: true

class CreateValues < ActiveRecord::Migration[7.0]
  def change
    create_table :values do |t|
      t.string :sender_address
      t.string :recipient_address
      t.timestamp :send_at
      t.integer :amount
      t.references :message, null: true, foreign_key: true

      t.timestamps
    end
  end
end
