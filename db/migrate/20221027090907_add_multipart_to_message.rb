# frozen_string_literal: true

class AddMultipartToMessage < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :multipart, :boolean
  end
end
