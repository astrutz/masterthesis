class CreateRecipients < ActiveRecord::Migration[7.0]
  def change
    create_table :recipients do |t|
      t.string :name
      t.string :email_address
      t.string :username
      t.string :password_digest
      t.integer :editing_performance_per_day

      t.timestamps
    end
  end
end
