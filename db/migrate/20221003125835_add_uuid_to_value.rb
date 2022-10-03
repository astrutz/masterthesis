# frozen_string_literal: true

class AddUuidToValue < ActiveRecord::Migration[7.0]
  def change
    add_column :values, :uuid, :string, null: false
  end
end
