class CreateValues < ActiveRecord::Migration[7.0]
  def change
    create_table :values do |t|
      t.string :sender_address
      t.string :recipient_address
      t.timestamp :send_at
      t.decimal :amount

      t.timestamps
    end
  end
end
