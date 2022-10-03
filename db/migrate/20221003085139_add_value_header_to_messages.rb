# frozen_string_literal: true

class AddValueHeaderToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :value_header, :string
  end
end
