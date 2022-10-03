# frozen_string_literal: true

class CreateInboxes < ActiveRecord::Migration[7.0]
  def change
    create_table :inboxes, &:timestamps
  end
end
