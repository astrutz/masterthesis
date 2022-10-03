# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.belongs_to :inbox, index: true
      t.string :sender_address
      t.string :recipient_address
      t.string :subject
      t.timestamp :send_at
      t.text :header_fields
      t.text :content

      t.timestamps
    end
  end
end
