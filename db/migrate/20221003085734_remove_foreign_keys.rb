# frozen_string_literal: true

class RemoveForeignKeys < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :values, :messages
  end
end
