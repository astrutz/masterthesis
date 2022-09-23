class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :sender_address
      t.string :recipient_address
      t.string :subject
      t.timestamp :send_at
      t.references :value, null: false, foreign_key: true
      t.text :header_fields, array: true
      t.text :content

      t.timestamps
    end
  end
end
