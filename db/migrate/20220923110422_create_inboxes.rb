class CreateInboxes < ActiveRecord::Migration[7.0]
  def change
    create_table :inboxes do |t|
      t.references :recipient, null: false, foreign_key: true
      t.references :messages, null: false, foreign_key: true
      t.references :rules, null: false, foreign_key: true

      t.timestamps
    end
  end
end
