class AddInboxToRecipients < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipients, :inbox, null: false, foreign_key: true
  end
end
