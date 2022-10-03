# frozen_string_literal: true

class CreateCredentials < ActiveRecord::Migration[7.0]
  def change
    create_table :credentials do |t|
      t.string :server
      t.integer :port
      t.string :ssl
      t.string :auth_type
      t.string :username
      t.string :password
      t.references :recipient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
